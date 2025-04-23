import 'package:crypto_app/pages/home/cubit/coin_data_cubit.dart';
import 'package:crypto_app/pages/home/cubit/coin_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coin_data_items.dart';

class CoinList extends StatelessWidget {
  const CoinList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => CoinDataCubit()..loadCoinData(),
      child: BlocBuilder<CoinDataCubit,CoinDataState>(
          builder: (context, state) {
            print(state);
            if(state is CoinDataLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is CoinDataLoaded){
              return SizedBox(
                height: size.height * 0.4,
                child: ListView.builder(
                  itemCount: state.coinList.length,
                  itemBuilder: (context, index) {
                    final data = state.coinList[index];
                    return CoinDataItem(data: data);
                  },
                ),
              );
            }
            return Container();
          },
      )
    );
  }
}




