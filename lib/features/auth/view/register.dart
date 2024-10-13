import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/layout/todo_app_cubit.dart';
import 'package:untitled/features/auth/view/login.dart';
import '../../../core/app_images/app_images.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/router/router.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/customtextform.dart';
import '../cubit/auth_cubit.dart';

// ignore: must_be_immutable
class TodoAppRegister extends StatefulWidget {
  const TodoAppRegister({super.key});

  @override
  State<TodoAppRegister> createState() => _TodoAppRegisterState();
}

class _TodoAppRegisterState extends State<TodoAppRegister> {
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var yearsController = TextEditingController();
  var levelController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var nameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  var code = "+20";
  List<String>? nameLevel = ["senior", "fresh", "junior", "midLevel"];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TodoAppCubit(),
        child: BlocConsumer<TodoAppCubit, TodoAppState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          systemOverlayStyle: const SystemUiOverlayStyle(
                              statusBarColor: Colors.transparent,
                              statusBarIconBrightness: Brightness.dark),
                          leading: const SizedBox(),
                          toolbarHeight: 0),
                      body: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                            image: const AssetImage(
                                                AppImages.constImage),
                                            fit: BoxFit.contain,
                                            height: 220.h,
                                            width: 1.sw),
                                        CustomText(
                                            text: 'Create your account',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24.sp),
                                        SizedBox(height: 24.h),
                                        CustomTextFormField(
                                            auto: AutovalidateMode
                                                .onUserInteraction,
                                            TextInputAction:
                                                TextInputAction.next,
                                            type: TextInputType.name,
                                            controller: nameController,
                                            title: 'Name',
                                            hint: 'Name',
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return '⚠️  ${'Please enter name'}';
                                              } else {
                                                return null;
                                              }
                                            },
                                            icondata: const SizedBox(),
                                            secure: false),
                                        SizedBox(height: 10.h),
                                        CustomTextFormField(
                                            auto: AutovalidateMode
                                                .onUserInteraction,
                                            TextInputAction:
                                                TextInputAction.next,
                                            type: TextInputType.phone,
                                            controller: phoneController,
                                            title: 'Phone',
                                            hint: '123 456-7890',
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  10),
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            prefixIcon: CountryCodePicker(
                                              padding: EdgeInsets.zero,
                                              onChanged: (country) {
                                                _countryController.text =
                                                    country.name ?? '';
                                                code = country.dialCode!;
                                              },
                                              initialSelection: 'EG',
                                              showFlag: true,
                                              showDropDownButton: true,
                                              alignLeft: false,
                                            ),
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return '⚠️  ${'Please enter phone'}';
                                              } else {
                                                return null;
                                              }
                                            },
                                            icondata: const SizedBox(),
                                            secure: false),
                                        SizedBox(height: 10.h),
                                        CustomTextFormField(
                                            auto: AutovalidateMode
                                                .onUserInteraction,
                                            TextInputAction:
                                                TextInputAction.next,
                                            type: TextInputType.number,
                                            controller: yearsController,
                                            title: 'Years',
                                            hint: 'Years of experience',
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return '⚠️  ${'Please enter years of experience'}';
                                              } else {
                                                return null;
                                              }
                                            },
                                            icondata: const SizedBox(),
                                            secure: false),
                                        SizedBox(height: 10.h),
                                        DropdownButtonFormField(
                                            itemHeight: 100.h,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                    fontFamily: 'tj',
                                                    color: Colors.red,
                                                    fontSize: ScreenUtil().orientation == Orientation.landscape
                                                        ? 10.sp
                                                        : 12.sp),
                                                contentPadding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        15.w, 10.h, 15.w, 10.h),
                                                hintStyle: TextStyle(
                                                    color:
                                                        const Color(0xFFD6D6D6),
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(
                                                        10.r),
                                                    borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFBABABA),
                                                        width: 1)),
                                                disabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.r),
                                                    borderSide: const BorderSide(color: Color(0xFFBABABA), width: 1)),
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFBABABA), width: 1)),
                                                suffixIconColor: const Color(0xFFBABABA)),
                                            borderRadius: BorderRadius.circular(10.r),
                                            style: TextStyle(fontFamily: 'tj', color: const Color(0xFF2E2B2B), fontWeight: FontWeight.w600, fontSize: ScreenUtil().orientation == Orientation.landscape ? 8.sp : 16.sp),
                                            hint: CustomText(text: levelController.text.isEmpty ? 'Choose experience Level' : levelController.text.toString(), color: const Color(0xFF2F2F2F), fontSize: 14.sp, fontWeight: levelController.text.isEmpty ? FontWeight.w400 : FontWeight.w600),
                                            icon: Icon(Icons.keyboard_arrow_down_outlined, size: 25.w),
                                            isExpanded: true,
                                            items: <DropdownMenuItem<String>>[
                                              DropdownMenuItem(
                                                  enabled: false,
                                                  value: 'nameLevel',
                                                  child: ListView.builder(
                                                    itemCount:
                                                        nameLevel!.length,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return InkWell(
                                                        onTap: () async {
                                                          setState(() {
                                                            levelController
                                                                    .text =
                                                                nameLevel![
                                                                    index];
                                                            MagicRouter.pop();
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: CustomText(
                                                              text: nameLevel![
                                                                  index],
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      );
                                                    },
                                                  ))
                                            ],
                                            onChanged: (newValue) {
                                              levelController.text = newValue!;
                                            }),
                                        SizedBox(height: 10.h),
                                        CustomTextFormField(
                                            auto: AutovalidateMode
                                                .onUserInteraction,
                                            TextInputAction:
                                                TextInputAction.next,
                                            type: TextInputType.name,
                                            controller: addressController,
                                            title: 'Address',
                                            hint: 'Address',
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return '⚠️  ${'Please enter address'}';
                                              } else {
                                                return null;
                                              }
                                            },
                                            icondata: const SizedBox(),
                                            secure: false),
                                        SizedBox(height: 10.h),
                                        CustomTextFormField(
                                            auto: AutovalidateMode
                                                .onUserInteraction,
                                            TextInputAction:
                                                TextInputAction.done,
                                            type: TextInputType.name,
                                            controller: passwordController,
                                            title: 'Password',
                                            hint: 'Password',
                                            suffix: IconButton(
                                                icon: Icon(
                                                    TodoAppCubit.get(context)
                                                        .suffix),
                                                onPressed: () {
                                                  TodoAppCubit.get(context)
                                                      .changePasswordVisibility();
                                                }),
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return '⚠️  ${'Please enter password'}';
                                              } else {
                                                return null;
                                              }
                                            },
                                            icondata: const SizedBox(),
                                            secure: TodoAppCubit.get(context)
                                                .isPassword)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.h),
                              state is SignUpLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                          color: ColorManager.backgroundColor))
                                  : CustomButton(
                                      text: 'Sign Up',
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          AuthCubit.get(context).signUp(
                                              context, code + phoneController.text,
                                              passwordController.text,
                                              nameController.text,
                                              yearsController.text,
                                              addressController.text,
                                              levelController.text);
                                        }
                                      }),
                              SizedBox(height: 15.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                      text: 'Already have any account? ',
                                      color: const Color(0xFF7F7F7F),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                  InkWell(
                                    onTap: () {
                                      MagicRouter.navigateTo(TodoAppLogin());
                                    },
                                    child: CustomText(
                                        text: 'Sign In',
                                        textDecoration:
                                            TextDecoration.underline,
                                        color: ColorManager.backgroundColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }));
  }
}
