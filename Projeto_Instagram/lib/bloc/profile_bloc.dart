import 'dart:async';
import 'package:flutter_insta/flutter_insta.dart';

class ProfileData {
  final FlutterInsta flutterInsta;

  ProfileData(this.flutterInsta);
}

class ProfileBloc {
  final _profileFetcher = StreamController<ProfileData>();

  Stream<ProfileData> get profileData => _profileFetcher.stream;

  Future<void> fetchProfileData(String username) async {
    try {
      final flutterInsta = FlutterInsta();
      await flutterInsta.getProfileData(username);

      if (flutterInsta.username == null) {
        throw Exception("Profile not found");
      }

      _profileFetcher.sink.add(ProfileData(flutterInsta));
    } catch (e) {
      _profileFetcher.addError(e);
      print("Error loading profile data: $e");
    }
  }

  void dispose() {
    _profileFetcher.close();
  }
}

final profileBloc = ProfileBloc();
