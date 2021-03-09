import 'package:e_commerce_app/business_logic/blocs/cart/bloc.dart';
import 'package:e_commerce_app/constants/constants.dart';
import 'package:e_commerce_app/utils/my_formatter.dart';
import 'package:e_commerce_app/views/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class OrderBottomNavBar extends StatelessWidget {
  const OrderBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -0.5),
              color: Colors.black12,
              blurRadius: 5,
            )
          ],
        ),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset("assets/icons/receipt.svg"),
                    ),
                    SizedBox(width: 10),

                    /// Total price
                    state is CartLoaded ? _buildTotalPrice(state) : Container(),
                  ],
                ),
                SizedBox(height: 20),

                /// Checkout button
                DefaultButton(
                  child: Text("Order", style: FONT_CONST.BOLD_WHITE_18),
                  onPressed: () async {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildTotalPrice(CartLoaded state) {
    var totalPriceOfGoods = formatNumber(state.totalCartPrice);
    var totalDeliveryFee = formatNumber(30000);
    var totalPrice = formatNumber(state.totalCartPrice + 30000);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total cost of goods: $totalPriceOfGoods₫",
          style: FONT_CONST.REGULAR_DEFAULT_16,
        ),
        Text(
          "Total delivery fee: $totalDeliveryFee₫",
          style: FONT_CONST.REGULAR_DEFAULT_16,
        ),
        Text.rich(
          TextSpan(
            style: FONT_CONST.REGULAR_DEFAULT_16,
            children: [
              TextSpan(text: "Total: "),
              TextSpan(
                text: "$totalPrice₫",
                style: FONT_CONST.BOLD_PRIMARY_18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}