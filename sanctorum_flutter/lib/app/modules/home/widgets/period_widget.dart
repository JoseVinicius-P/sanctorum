import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/data_field_widget.dart';
import 'package:sanctorum_flutter/app/modules/home/widgets/two_radiobutton_widget.dart';

class PeriodWidget extends StatefulWidget {
  const PeriodWidget({super.key, required this.isPeriod, required this.initialPeriod, required this.updatePeriod});

  final bool isPeriod;
  final List<Date>? initialPeriod;
  final void Function(List<Date>?) updatePeriod;

  @override
  State<PeriodWidget> createState() => _PeriodWidgetState();
}

class _PeriodWidgetState extends State<PeriodWidget> {
  late bool isPeriod;
  late List<Date>? period;

  @override
  void initState() {
    isPeriod = widget.isPeriod;
    period = widget.initialPeriod;
    super.initState();
  }

  void updatePeriod(List<Date>? newPeriod) async {
    period = newPeriod;
  }

  void updateFirstDate(Date? newDate) async {
    debugPrint("Perido: $isPeriod, Periodo tem: ${period.toString()}");
    setState(() {
      if(newDate != null){
        if(period != null && period!.isNotEmpty){
          period!.first = newDate;
        }else{
          period = [newDate];
        }
      }
    });
  }

  void updateLastDate(Date? newDate) async {
    setState(() {
      if(newDate != null){
        if(period != null){
          period!.add(newDate);
        }
      }else {
        if ((period?.length ?? 0) > 1) {
          period?.removeLast();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TwoRadioButtonWidget<bool>(
            initialValue: isPeriod,
            text1: 'Data exata',
            text2: 'Período',
            value1: false,
            value2: true,
            onChanged: (isPeriod){
              if(isPeriod != null){
                setState(() {
                  this.isPeriod = isPeriod;
                });
                !this.isPeriod ? widget.updatePeriod(null) : (){
                  updateLastDate(period?.first);
                  widget.updatePeriod(period);
                };
              }
            }
        ),
        const SizedBox(height: 5,),
        DataFieldWidget(title: isPeriod ? 'Data inicial' : 'Data', date: period != null && period!.isNotEmpty ? period!.first : null, update: (date){
          updateFirstDate(date);
          widget.updatePeriod(period);
        }),
        const SizedBox(height: 5,),
        if(isPeriod && period != null && period!.isNotEmpty)
          DataFieldWidget(title: 'Data final', date: period != null && period!.isNotEmpty ? period!.last : null, update: (date){
            updateLastDate(date);
            widget.updatePeriod(period);
          }),
      ],
    );
  }
}
