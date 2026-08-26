import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get android => const FirebaseOptions(
        apiKey: 'AIzaSyBCsQDkpRz1fU0L5PHICeIrup8NvrTH81Y',
        appId: '1:744515996792:android:c421387fe668079a68718d',
        messagingSenderId: '744515996792',
        projectId: 'ai-talking-avatar-c9de2',
        storageBucket: 'ai-talking-avatar-c9de2.firebasestorage.app',
      );

  static FirebaseOptions get currentPlatform {
    return android;
  }
}
