import 'package:bloc/bloc.dart';
import 'package:finance/data/models/finance_model.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState>{
  FetchDataCubit() : super(FetchDataInitial());
  List<FinanceModel> finance = [];
  List<FinanceModel> todayFinance = [];
  double sum = 0;
  double todaySum = 0;

  fetchData({DateTime? dateTime}){
    emit(FetchDataLoading());
    try {
      finance = Hive
          .box<FinanceModel>('financeBox')
          .values
          .toList();
      todayFinance = finance
          .where((element) => DateFormat.yMMMEd().format(element.date) == DateFormat.yMMMEd().format(dateTime ?? DateTime.now()),).toList();
      sum = 0;
      todaySum = 0;
      for(var element in finance){
        sum += element.financeValue;
      }
      for(var element in todayFinance){
        todaySum += element.financeValue;
      }
      emit(FetchDataSuccess());
    }catch(e){
      emit(FetchDataFailure(e.toString()));
    }
    return finance;
  }


}