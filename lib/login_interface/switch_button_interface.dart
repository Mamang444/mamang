

class ISwitchButton {
  Future<bool> getK(String key) async {
    return true;
  }
  Future delete(String key) async {}
  Future put(String key, bool value) async {}
}