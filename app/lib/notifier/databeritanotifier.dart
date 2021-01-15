import 'package:app/models/beritamodels.dart';
import 'package:app/repository/databeritarepository.dart';
import 'package:flutter_riverpod/all.dart';

abstract class DataBeritaState {
  const DataBeritaState();
}

class DataBeritaLoading extends DataBeritaState {
  const DataBeritaLoading();
}

class DataBeritaLoaded extends DataBeritaState {
  final DataBerita dataBerita;
  const DataBeritaLoaded(this.dataBerita);
}

class DataBeritaError extends DataBeritaState {
  final String message;
  const DataBeritaError(this.message);
}

class DataBeritaNotifier extends StateNotifier<DataBeritaState> {
  DataBeritaRepository _dataBeritaRepository;
  DataBeritaNotifier(this._dataBeritaRepository) : super(DataBeritaLoading());

  Future<void> fetchDataBerita() async {
    try {
      final result = await _dataBeritaRepository.fetchDataBerita();
      state = DataBeritaLoaded(result);
    } catch (e) {
      state = DataBeritaError('$e');
    }
  }
}
