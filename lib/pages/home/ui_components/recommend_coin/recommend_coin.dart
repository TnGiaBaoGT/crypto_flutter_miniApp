import 'package:crypto_app/constants.dart';
import 'package:crypto_app/pages/home/cubit/coin_data_cubit.dart';
import 'package:crypto_app/pages/home/cubit/coin_data_state.dart';
import 'package:crypto_app/pages/home/ui_components/recommend_coin/recommend_coin_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendCoin extends StatelessWidget {
  const RecommendCoin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinDataCubit()..loadCoinData(),
      child: BlocBuilder<CoinDataCubit,CoinDataState>(
        builder: (context, state) {
          if(state is CoinDataLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is CoinDataLoaded){
            return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: kDefaultPadding/2),
                      child: Text('Recommend To Buy',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                          itemBuilder: (context, index) {
                            final data = state.coinList[index];
                            return RecommendCoinItem(data: data);
                          },
                      ),
                    ),
                  ],
                ),
            );
          }
        return Container();
      },),
    );
  }
}

