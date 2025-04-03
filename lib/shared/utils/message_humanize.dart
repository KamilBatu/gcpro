String humanizeMessage(dynamic message) {
  if (message is List) {
    return message.join(' ');
  } else if (message is String) {
    return message;
  } else {
    return 'An unknown error occurred';
  }
}

String humanizeActivity(String activity) {
  return activity.split('_').map((e) => e[0].toUpperCase() + e.substring(1)).join(' ');
}
