// import 'package:connectivity_wrapper/connectivity_wrapper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mara/Modules/AllPages/Error/errorScreen.dart';
// import 'package:mara/Modules/AllPages/Giftbox/giftBox.dart';
// import 'package:mara/Modules/AllPages/Help/howToUseScreen.dart';
// import 'package:mara/Modules/AllPages/Luky/lucky.dart';
// import 'package:mara/Modules/AllPages/Money/money.dart';
// import 'package:mara/Modules/AllPages/Money/transactions.dart';
// import 'package:mara/Modules/AllPages/Points/points.dart';
// import 'package:mara/Modules/AllPages/Recommend/recommend.dart';
// import 'package:mara/Modules/AllPages/ScanerPage/scaner.dart';
// import 'package:mara/Modules/drawer/custom_list_tile.dart';
// import 'package:mara/Shared/Componants/Reusable/reusableComponents.dart';
// import 'package:mara/Shared/Constants/constants.dart';
// import 'package:mara/Shared/Cubit/AppCubit/cubit.dart';
// import 'package:mara/Shared/Cubit/AppCubit/states.dart';
// import 'package:mara/Style/Colors/colors.dart';
// import 'package:showcaseview/showcaseview.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   final GlobalKey pointsKey = GlobalKey();
//
//   final GlobalKey qrScanKey = GlobalKey();
//
//   final GlobalKey moneyKey = GlobalKey();
//
//   final GlobalKey giftBoxKey = GlobalKey();
//
//   final GlobalKey wheelOfFortuneKey = GlobalKey();
//
//   final GlobalKey contactUsKey = GlobalKey();
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback(
//           (_) => ShowCaseWidget.of(context).startShowCase([
//         pointsKey,
//         qrScanKey,
//         moneyKey,
//         giftBoxKey,
//         wheelOfFortuneKey,
//         contactUsKey
//       ]),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: () async {
//         AppCubit.get(context).getMyWallet();
//       },
//       child: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: Text('الصفحة الرئيسية'),
//           centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: Padding(
//                 padding: EdgeInsets.only(right: 15.sp),
//                 child: Icon(
//                   Icons.notifications_active,
//                   color: whiteColor,
//                   size: 25.sp,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         drawer: Drawer(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(),
//           ),
//           backgroundColor: whiteColor,
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(10.sp),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   SizedBox(height: 20.h),
//                   Center(
//                     child: Text(
//                       'مرحباً بك',
//                       style: TextStyle(
//                           color: darkBlueColor,
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         CustomListTileCollapsed(
//                           icon: Image.asset(
//                             'assets/images/help.png',
//                             width: 26.w,
//                           ),
//                           title: 'طريقة الأستخدام',
//                           infoCount: 0,
//                           onTap: () {
//                             navTo(context, HwoToUseScreen());
//                           },
//                         ),
//                         CustomListTileCollapsed(
//                           icon: Image.asset(
//                             'assets/images/cach.png',
//                             width: 22.w,
//                           ),
//                           title: 'الرصيد النقدي',
//                           infoCount: 0,
//                           onTap: () {
//                             navTo(context, Money());
//                           },
//                         ),
//                         CustomListTileCollapsed(
//                           icon: Image.asset(
//                             'assets/images/buy.png',
//                             width: 26.w,
//                           ),
//                           title: 'سجل العمليات',
//                           infoCount: 0,
//                           onTap: () {
//                             AppCubit.get(context).getTransferQr();
//                             navTo(context, Transactions());
//                           },
//                         ),
//                         CustomListTileCollapsed(
//                           icon: Image.asset(
//                             'assets/images/contact.png',
//                             width: 22.w,
//                           ),
//                           title: 'تواصل معنا',
//                           infoCount: 0,
//                           onTap: () {},
//                         ),
//                         CustomListTileCollapsed(
//                           icon: Image.asset(
//                             'assets/images/logout.png',
//                             width: 26.w,
//                           ),
//                           title: 'تسجيل الخروج',
//                           infoCount: 0,
//                           onTap: () {
//                             logout(context);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: ConnectivityWidgetWrapper(
//           disableInteraction: false,
//           child: BlocConsumer<AppCubit, AppStates>(
//             listener: (context, state) {},
//             builder: (context, state) {
//               var cubit = AppCubit.get(context);
//               return ListView(
//                 children: [
//                   Column(
//                     children: [
//                       if (state is! GetMyWalletLoadingState &&
//                           cubit.myWallet != null)
//                         SfRadialGauge(
//                           enableLoadingAnimation: true,
//                           title: GaugeTitle(
//                               text: 'أهلا ${userName ?? ''}',
//                               textStyle: TextStyle(
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.w500,
//                                   color: darkBlueColor)),
//                           axes: <RadialAxis>[
//                             RadialAxis(
//                               ticksPosition: ElementsPosition.outside,
//                               labelsPosition: ElementsPosition.outside,
//                               minorTicksPerInterval: 2,
//                               majorTickStyle: MajorTickStyle(
//                                 length: 12,
//                               ),
//                               maximumLabels: 4,
//                               showLastLabel: true,
//                               useRangeColorForAxis: true,
//                               axisLineStyle: const AxisLineStyle(),
//                               minimum: 0,
//                               maximum: 2800,
//                               ranges: <GaugeRange>[
//                                 GaugeRange(
//                                   startValue: 0,
//                                   endValue: cubit.myWallet!.walletBalance!,
//                                   color: goldColor.withOpacity(.8),
//                                   startWidth: 10,
//                                   endWidth: 10,
//                                 ),
//                               ],
//                               pointers: <GaugePointer>[
//                                 NeedlePointer(
//                                   value: cubit.myWallet!.walletBalance!,
//                                   needleColor: goldColor,
//                                 ),
//                               ],
//                               annotations: <GaugeAnnotation>[
//                                 GaugeAnnotation(
//                                   widget: Column(
//                                     children: [
//                                       Text('${cubit.myWallet!.walletBalance!}',
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w500,
//                                               color: darkBlueColor)),
//                                       Text('نقطةعن الشهرالحالي',
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500,
//                                               color: darkBlueColor)),
//                                     ],
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                   ),
//                                   angle: 90,
//                                   positionFactor: 0.4,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       Padding(
//                         padding: EdgeInsets.all(20.0.sp),
//                         child: GridView.count(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 10.w,
//                           mainAxisSpacing: 10.h,
//                           shrinkWrap: true,
//                           children: [
//                             Showcase(
//                               key: pointsKey,
//                               description: 'View your points',
//                               child: GestureDetector(
//                                 onTap: () {
//                                   navTo(context, Points());
//                                 },
//                                 child: Card(
//                                   elevation: 3,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.sp),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/points.png',
//                                         width: 50.w,
//                                       ),
//                                       Text(
//                                         'نقاط الحافز',
//                                         style: TextStyle(
//                                             color: darkBlueColor,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Showcase(
//                               key: qrScanKey,
//                               description: 'Scan QR codes',
//                               child: GestureDetector(
//                                 onTap: () {
//                                   navTo(context, QRScan(isTransfer: false));
//                                 },
//                                 child: Card(
//                                   elevation: 3,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.sp),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/qr.png',
//                                         width: 50.w,
//                                       ),
//                                       Text(
//                                         'تسجيل الشحنة',
//                                         style: TextStyle(
//                                             color: darkBlueColor,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Showcase(
//                               key: moneyKey,
//                               description: 'View your cash balance',
//                               child: GestureDetector(
//                                 onTap: () {
//                                   navTo(context, Money());
//                                 },
//                                 child: Card(
//                                   elevation: 3,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.sp),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/cach.png',
//                                         width: 30.w,
//                                       ),
//                                       Text(
//                                         'الرصيد النقدي',
//                                         style: TextStyle(
//                                             color: darkBlueColor,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Showcase(
//                               key: giftBoxKey,
//                               description: 'Check your gift box',
//                               child: GestureDetector(
//                                 onTap: () {
//                                   cubit.getUserGifts().then((value) {
//                                     navTo(context, GiftBoxScreen());
//                                   });
//                                 },
//                                 child: Card(
//                                   elevation: 3,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.sp),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/gift.png',
//                                         width: 55.w,
//                                       ),
//                                       Text(
//                                         'صندوق الهدايا',
//                                         style: TextStyle(
//                                             color: darkBlueColor,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Showcase(
//                               key: wheelOfFortuneKey,
//                               description:
//                               'Try your luck with the wheel of fortune',
//                               child: GestureDetector(
//                                 onTap: () {
//                                   navTo(context, WheelOfFortune());
//                                 },
//                                 child: Card(
//                                   elevation: 3,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.sp),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/luky.png',
//                                         width: 50.w,
//                                       ),
//                                       Text(
//                                         'عجلة الحظ',
//                                         style: TextStyle(
//                                             color: darkBlueColor,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Showcase(
//                               key: contactUsKey,
//                               description: 'Contact us for support',
//                               child: Card(
//                                 elevation: 3,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.sp),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/contact.png',
//                                       width: 55.w,
//                                     ),
//                                     Text(
//                                       'تواصل معنا',
//                                       style: TextStyle(
//                                           color: darkBlueColor,
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
