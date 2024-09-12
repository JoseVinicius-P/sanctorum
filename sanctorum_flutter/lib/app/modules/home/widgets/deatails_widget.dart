
import 'package:flutter/material.dart';
import 'package:sanctorum_flutter/app/shared/extensions/details.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';
import 'package:sanctorum_flutter/app/shared/widgets/text_field_widget.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.initialDetails, required this.update,
  });

  final Details? initialDetails;
  final void Function(Details?) update;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 15,),
        Flexible(
          child: TextFieldWidget(
            maxLines: 1,
            hint: "País",
            text: initialDetails?.country,
            validator: StringValidator(),
            onChanged: (text){
              initialDetails?.country = text;
              update(initialDetails);
            },
          ),
        ),
        Flexible(
          child: TextFieldWidget(
            maxLines: 1,
            hint: "País que corresponde atualmente",
            text: initialDetails?.correspondentActualCountry,
            validator: StringValidator(),
            onChanged: (text){
              initialDetails?.correspondentActualCountry = text;
              update(initialDetails);
            },
          ),
        ),
        Flexible(
          child: TextFieldWidget(
            maxLines: 1,
            hint: "Cidade",
            text: initialDetails?.city,
            validator: StringValidator(),
            onChanged: (text){
              initialDetails?.city = text;
              update(initialDetails);
            },
          ),
        ),
        Flexible(
          child: TextFieldWidget(
            maxLines: 1,
            hint: "Detalhes",
            text: initialDetails?.details,
            validator: StringValidator(),
            onChanged: (text){
              initialDetails?.details = text;
              update(initialDetails);
            },
          ),
        ),
      ],
    );
  }
}