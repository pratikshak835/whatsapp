import 'package:common_jds_flutter/widgets/chip_widget/chip_widget.dart';
import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/app/app_images/app_images.dart';

class CustomTable extends StatelessWidget {
  final List<String> headerList;
  final List<double>? headerWidthList;
  final List<List<String>> rowsList;
  final int fixedLeftColumns;
  final List<double?>? fixedColumnWidth;
  final bool showActionDropdown;
  final Function? onActionDropDown;
  final EdgeInsetsGeometry contentPadding;
  final AlignmentGeometry contentAlignment;
  final EdgeInsetsGeometry actionsHeadingPadding;
  final EdgeInsetsGeometry? actionsPadding;
  final AlignmentGeometry actionsAlignment;
  final double actionsColumnWidth;
  final Offset offset;
  final bool isExpanded;

  const CustomTable({
    super.key,
    required this.headerList,
    required this.rowsList,
    this.fixedLeftColumns = 0,
    this.fixedColumnWidth,
    this.headerWidthList,
    this.showActionDropdown = false,
    this.onActionDropDown,
    this.isExpanded = true,
    this.contentPadding = EdgeInsets.zero,
    this.contentAlignment = Alignment.center,
    this.actionsHeadingPadding = EdgeInsets.zero,
    this.actionsPadding,
    this.actionsAlignment = Alignment.center,
    this.actionsColumnWidth = 150,
    this.offset = const Offset(
      -10,
      30,
    ),
  });

  @override
  Widget build(BuildContext context) {
    int statusColumnIndex = headerList.indexOf("Status");
    int imagesColumnIndex = headerList.indexOf("Image");
    Widget tableWidget = ClipRRect(
      borderRadius: fixedLeftColumns != 0
          ? BorderRadius.zero
          : const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
      child: DataTable2(
        empty: const Center(
          child: CustomText(
            text: "No Data",
          ),
        ),
        // minWidth: fixedColumnWidth != null
        //     ? headerList.length * fixedColumnWidth! * 2
        //     : null,
        fixedLeftColumns: fixedLeftColumns,
        border: TableBorder.symmetric(
          inside: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
        dividerThickness: 1,
        headingRowHeight: 50,
        dataRowHeight: 50,
        horizontalMargin: 0, showBottomBorder: true,
        columnSpacing: 0,
        // fixedColumnsColor: fixedLeftColumns != 0
        //     ? AppColors.appBarColor.withOpacity(0.3)
        //     : null,
        headingRowDecoration:
            BoxDecoration(color: Colors.orangeAccent.withOpacity(0.5)),
        columns: <DataColumn>[
          for (final (index, header) in headerList.indexed)
            DataColumn2(
              fixedWidth:
                  fixedColumnWidth != null ? fixedColumnWidth![index] : null,
              label: Container(
                alignment: contentAlignment,
                padding: contentPadding,
                child: CustomText(
                  text: header,
                  fontWeight: CustomFontWeight.bold,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  size: 14,
                ),
              ),
              // fixedWidth: fixedColumnWidth,
            ),
          if (showActionDropdown)
            DataColumn2(
              fixedWidth: actionsColumnWidth,
              label: Container(
                alignment: actionsAlignment,
                padding: actionsHeadingPadding,
                child: const CustomText(
                  text: "Actions",
                  fontWeight: CustomFontWeight.bold,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  size: 14,
                ),
              ),
              // fixedWidth: fixedColumnWidth,
            ),
        ],
        rows: <DataRow>[
          for (int i = 0; i < rowsList.length; i++)
            DataRow2(
              // color: i % 2 == 0
              //     ? MaterialStatePropertyAll(
              //         AppColors.appBarColor.withOpacity(0.1))
              //     : const MaterialStatePropertyAll(AppColors.white),
              cells: <DataCell>[
                for (String rowElement in rowsList[i])
                  DataCell(
                    statusColumnIndex == rowsList[i].indexOf(rowElement)
                        ? Container(
                            alignment: contentAlignment,
                            padding: contentPadding,
                            child: CustomChipWidget(
                              textForDisplay: rowElement,
                              showRemoveIcon: false,
                              radius: 20,
                              textColor: getChipColor(rowElement),
                              backgroundColor:
                                  getChipColor(rowElement)?.withOpacity(0.2),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              onRemoveIconTap: () {},
                            ),
                          )
                        : imagesColumnIndex == rowsList[i].indexOf(rowElement)
                            ? rowElement.isEmpty || rowElement == ""
                                ? const CustomText(text: "No Image Available")
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Center(
                                      child: Image.network(
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          print("ERRRRR $rowElement");
                                          if (rowElement.contains(
                                              "https://search.app/tPxebKCRfgVTe4zY9")) {
                                            return Image.asset(
                                              AppImages.watch,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            );
                                          } else if (rowElement.contains(
                                              "https://www.ajio.com/new-balance-two-way-basketball-shoes/p/469633821_blue")) {
                                            return Image.asset(
                                              AppImages.newBalanceShoes,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            );
                                          } else if (rowElement.contains(
                                              "https://www.ajio.com/asics-men-gel-kinsei-max-lace-up-running-shoes/p/700216290_grey")) {
                                            return Image.asset(
                                              AppImages.asicsShoes,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            );
                                          } else {
                                            return const Text(
                                                "No Image Available");
                                          }
                                        },
                                        alignment: Alignment.center,
                                        rowElement,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                            : Container(
                                alignment: contentAlignment,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomText(
                                  text: rowElement,
                                  fontWeight: fixedLeftColumns != 0 &&
                                          rowElement == rowsList[i].first
                                      ? CustomFontWeight.bold
                                      : CustomFontWeight.medium,
                                  size: 14,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                  ),
              ],
            ),
        ],
      ),
    );
    if (!isExpanded) return tableWidget;

    return Expanded(
      child: tableWidget,
    );
  }

  Color? getChipColor(String status) {
    switch (status) {
      case "Success":
        return Colors.amber;
      case "Delivered":
        return Colors.green;
      case "Out for Delivery":
        return Colors.purple;
      case "Pending":
        return Colors.blue;
    }
    return null;
  }
}
