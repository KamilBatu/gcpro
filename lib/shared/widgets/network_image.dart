import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:gcpro/services/services_provider.dart';
import 'package:gcpro/services/token_cache_service/domain/repositories/token_cache_repository.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef DecoderCallback = Future<ui.Codec> Function(
  Uint8List bytes, {
  int? cacheWidth,
  int? cacheHeight,
});

class NetworkImageWithToken extends ConsumerWidget {
  const NetworkImageWithToken({
    required this.url,
    super.key,
    this.width,
    this.height,
  });
  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (url.isEmpty) {
      return const SizedBox();
    }
    if (url.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
      );
    }
    final TokenRepository tokenService = ref.read(tokenServiceProvider);
    final token = tokenService.getAccessToken();
    return CachedNetworkImage(
      imageUrl: "https://$fileServerHost/uf/api/v1/file$url",
      httpHeaders: {'Authorization': 'Bearer $token'},
      width: width,
      height: height,
    );
  }
}

@immutable
class CustomNetworkImage extends ImageProvider<Uri> {
  const CustomNetworkImage(this.getToken, this.url);

  final Future<String?> Function() getToken;
  final String url;

  @override
  Future<Uri> obtainKey(ImageConfiguration configuration) {
    final Uri result = Uri(
      scheme: 'https',
      host: fileServerHost,
      path: "/uf/api/v1/file$url",
    );

    if (url.startsWith('http')) {
      return SynchronousFuture<Uri>(Uri.parse(url));
    }

    return SynchronousFuture<Uri>(result);
  }

  static HttpClient get _httpClient {
    HttpClient? client;
    assert(
      () {
        if (debugNetworkImageHttpClientProvider != null) {
          client = debugNetworkImageHttpClientProvider!();
        }
        return true;
      }(),
      'NetworkImage.debugNetworkImageHttpClientProvider must not be null.',
    );
    return client ?? HttpClient()
      ..autoUncompress = false;
  }

  @override
  ImageStreamCompleter loadImage(Uri key, ImageDecoderCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();
    debugPrint('Fetching "$key"...');

    return MultiFrameImageStreamCompleter(
      codec: _httpClient
          .getUrl(key)
          .then<HttpClientResponse>((HttpClientRequest request) async {
            final token = await getToken();
            request.headers.set('Authorization', 'Bearer $token');
            return request.close();
          })
          .then<Uint8List>((HttpClientResponse response) {
            return consolidateHttpClientResponseBytes(
              response,
              onBytesReceived: (int cumulative, int? total) {
                chunkEvents.add(
                  ImageChunkEvent(
                    cumulativeBytesLoaded: cumulative,
                    expectedTotalBytes: total,
                  ),
                );
              },
            );
          })
          .catchError((Object e, StackTrace stack) {
            scheduleMicrotask(() {
              PaintingBinding.instance.imageCache.evict(key);
            });
            return Future<Uint8List>.error(e, stack);
          })
          .whenComplete(chunkEvents.close)
          .then<ui.ImmutableBuffer>(ui.ImmutableBuffer.fromUint8List)
          .then<ui.Codec>(decode),
      chunkEvents: chunkEvents.stream,
      scale: 1,
      debugLabel: '"key"',
      informationCollector: () => <DiagnosticsNode>[
        DiagnosticsProperty<ImageProvider>('Image provider', this),
        DiagnosticsProperty<Uri>('URL', key),
      ],
    );
  }

  @override
  String toString() =>
      '${objectRuntimeType(this, 'CustomNetworkImage')}("$url")';
}
