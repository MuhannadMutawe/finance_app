import 'package:finance/cubit/fetch_data/fetch_data_cubit.dart';
import 'package:finance/data/models/finance_model.dart';
import 'package:finance/screens/add_commitment_screen.dart';
import 'package:finance/screens/see_all.dart';
import 'package:finance/utils/colors.dart';
import 'package:finance/widget/Home_bottoms.dart';
import 'package:finance/widget/home_item_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FetchDataCubit>(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDataCubit, FetchDataState>(
      builder: (BuildContext context,  state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appBarTitle),
            titleSpacing: 24,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeItemBalance(
                    title: AppLocalizations.of(context)!.sliderLabel1,
                    subTitle: NumberFormat.compactCurrency(decimalDigits: 3,).format(BlocProvider.of<FetchDataCubit>(context).sum).toString(),
                    color: kSecondaryPurple,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  HomeItemBalance(
                    title: AppLocalizations.of(context)!.sliderLabel2,
                    subTitle: NumberFormat.compactCurrency(decimalDigits: 3).format(BlocProvider.of<FetchDataCubit>(context).todaySum).toString(),
                    color: kSecondaryBlue,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  HomeBottoms(),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.activity,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SeeAll(),)),
                        child: Text(
                          AppLocalizations.of(context)!.seeAll,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Visibility(
                    visible: state is FetchDataSuccess,
                    replacement: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        List<FinanceModel> data = BlocProvider.of<FetchDataCubit>(context).todayFinance.reversed.toList();
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerStart,
                            decoration: BoxDecoration(
                              color: kSecondaryGreen,
                            ),
                            child: Icon(Icons.edit,color: kWhiteColor,),
                          ),
                          secondaryBackground: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerEnd,
                            decoration: BoxDecoration(
                              color: kSecondaryRed,
                            ),
                            child: Icon(Icons.delete,color: kWhiteColor,),
                          ),
                          onDismissed: (direction) {
                            if(direction == DismissDirection.startToEnd){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AddCommitmentScreen(isPlus: data[index].financeValue > 0 ? true : false,financeModel: data[index],),),);
                            }else if (direction == DismissDirection.endToStart){
                              data[index].delete();
                              BlocProvider.of<FetchDataCubit>(context).fetchData();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: data[index].financeValue > 0 ? kSecondaryGreen : kSecondaryRed,
                                ),
                                SizedBox(width: 18,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index].details,style: Theme.of(context).textTheme.bodyLarge,),
                                    Text(DateFormat.yMMMEd().format(data[index].date).toString(),style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                ),
                                Spacer(),
                                Text(data[index].financeValue.toString(),style: Theme.of(context).textTheme.bodyLarge)
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: BlocProvider.of<FetchDataCubit>(context).todayFinance.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 3,);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
