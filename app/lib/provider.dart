import 'package:app/notifier/databeritanotifier.dart';
import 'package:app/notifier/datacovidnotifier.dart';
import 'package:app/repository/databeritarepository.dart';
import 'package:app/repository/datacovidrepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataCovidRepositoryProvider = Provider<DataCovidRepository>((ref) {
  return DataCovidRepositorySub();
});
final dataCovidNotifierProvider = StateNotifierProvider(
    (ref) => DataCovidNotifier(ref.watch(dataCovidRepositoryProvider)));

final dataBeritaRepositoryProvider = Provider<DataBeritaRepository>((ref) {
  return DataBeritaRepositorySub();
});
final dataBeritaNotifierProvider = StateNotifierProvider(
    (ref) => DataBeritaNotifier(ref.watch(dataBeritaRepositoryProvider)));
