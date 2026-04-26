import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';

import '../../../../../../core/widgets/text_field_widget.dart';
import '../../../../../others_feature/domain/entities/country.dart';
import '../../controllers/update_profile_controller.dart';
import 'drop_down_widget.dart';
import 'search_time_zone_widget.dart';

class LocalizationWidget extends StatelessWidget {
  const LocalizationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TimeZone'.tr,
              style: TextStyle(
                fontSize: 11.sp,
                color: ColorManager.grey,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SearchTimeZoneWidget(
              data: controller.timezones.map((selectedCountry) {
                return DropdownMenuItem<String>(
                  value: selectedCountry,
                  child: Text(selectedCountry,
                      style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedValueTimeZone = value!;
                controller.update();
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Country'.tr,
              style: TextStyle(
                fontSize: 11.sp,
                color: ColorManager.grey,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            DropDownWidget(
              type: 'country',
              dataObject: controller.countries.map((selectedCountry) {
                return DropdownMenuItem<Country>(
                  value: selectedCountry,
                  child: Text(
                    selectedCountry.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                );
              }).toList(),
              value: controller.selectedValueCountries.title,
              onChanged: (value) {
                controller.selectedValueCountries = value!;
                controller.update();
                controller.getProvinces(
                  controller.selectedValueCountries.id,
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Province'.tr,
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorManager.grey,
              ),
            ),
            SizedBox(height: 8.h),
            DropDownWidget(
              value: controller.selectedValueProvinces.title,
              type: 'province',
              dataObject: controller.provinces.map((selectedCountry) {
                return DropdownMenuItem<Country>(
                  value: selectedCountry,
                  child: Text(
                    selectedCountry.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedValueProvinces = value!;
                controller.update();

                controller.getCities(controller.selectedValueProvinces.id);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'City'.tr,
              style: TextStyle(
                fontSize: 11.sp,
                color: ColorManager.grey,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            DropDownWidget(
              value: controller.selectedValueCities.title,
              type: 'city',
              dataObject: controller.cities.map((selectedCountry) {
                return DropdownMenuItem<Country>(
                  value: selectedCountry,
                  child: Text(selectedCountry.title,
                      style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedValueCities = value!;
                controller.update();
                controller.getDistricts(controller.selectedValueCities.id);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'District'.tr,
              style: TextStyle(
                fontSize: 11.sp,
                color: ColorManager.grey,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            DropDownWidget(
              value: controller.selectedValueDistrict.title,
              type: 'district',
              dataObject: controller.districts.map((selectedCountry) {
                return DropdownMenuItem<Country>(
                  value: selectedCountry,
                  child: Text(selectedCountry.title,
                      style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedValueDistrict = value!;
                controller.update();
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Form(
              key: controller.formKeyLocalization,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address'.tr,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: ColorManager.grey,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: ColorManager.grey6)),
                    child: textFormField(
                      type: TextInputType.text,
                      borderColor: ColorManager.white,
                      textSize: 14,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                      controller: controller.addressCtrl,
                      validatorMessage: 'EnterAddress'.tr,
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
