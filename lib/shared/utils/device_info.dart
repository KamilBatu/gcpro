import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

Future<String> getDeviceInfo() async {
  final String deviceId = await getDeviceId();
  final String deviceName = await getDeviceName();

  return '$deviceName $deviceId';
}

Future<String> getDeviceId() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String uniqueId;

  switch (Platform.operatingSystem) {
    case 'android':
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      uniqueId = androidInfo.manufacturer + androidInfo.model + androidInfo.serialNumber;
    case 'ios':
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      uniqueId = iosInfo.identifierForVendor ?? const Uuid().v4();
    case 'windows':
      final WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      uniqueId = windowsInfo.deviceId;
    case 'linux':
      final LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      uniqueId = linuxInfo.machineId ?? const Uuid().v4();
    case 'macos':
      final MacOsDeviceInfo macOsInfo = await deviceInfo.macOsInfo;
      uniqueId = macOsInfo.model;
    default:
      uniqueId = const Uuid().v4();
  }

  return uniqueId;
}

Future<String> getDeviceName() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String uniqueName;

  switch (Platform.operatingSystem) {
    case 'android':
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      uniqueName = "${androidInfo.brand};${androidInfo.model};${androidInfo.product}";
    case 'ios':
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      uniqueName = "${iosInfo.systemName};${iosInfo.model}; ${iosInfo.utsname}";
    case 'windows':
      final WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      uniqueName = "${windowsInfo.computerName};${windowsInfo.productType};${windowsInfo.productName}";
    case 'linux':
      final LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      uniqueName = "${linuxInfo.name};${linuxInfo.version};${linuxInfo.machineId}";
    case 'macos':
      final MacOsDeviceInfo macOsInfo = await deviceInfo.macOsInfo;
      uniqueName = "${macOsInfo.computerName};${macOsInfo.model};${macOsInfo.kernelVersion}";
    default:
      uniqueName = const Uuid().v4();
  }

  return uniqueName;
}
