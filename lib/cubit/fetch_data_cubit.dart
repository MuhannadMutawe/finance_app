import 'package:bloc/bloc.dart';
import 'package:finance/data/models/finance_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState>{
  FetchDataCubit() : super(FetchDataInitial());
  List<FinanceModel> _financeModel = [];

  fetchData(){
    emit(FetchDataLoading());
    try {
      _financeModel = Hive
          .box<FinanceModel>('financeBox')
          .values
          .toList();
      emit(FetchDataSuccess());
    }catch(e){
      emit(FetchDataFailure(e.toString()));
    }
    return _financeModel;
  }
}