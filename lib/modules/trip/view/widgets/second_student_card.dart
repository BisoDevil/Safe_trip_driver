import 'package:safe_trip_driver_app/data/models/student_model.dart';
import 'package:safe_trip_driver_app/index.dart';


class SecondStudentCard extends StatelessWidget {
  final StudentModel studentModel;
  const SecondStudentCard({super.key, required this.studentModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteTextColor,
        borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 20.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: AppColors.appBarBackgroundColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(studentModel.student.logo)
                ),
                borderRadius: BorderRadius.circular(AppRadius.cardBorderRadius),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            studentModel.student.name,
                            style: regularStyle(AppFontSize.xLarge, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 12),
                            child: Text(
                              studentModel.status,
                              style: regularStyle(AppFontSize.xSmall, AppColors.whiteTextColor, getFontFamilyFromLanguageCode()),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      studentModel.student.address,
                      style: regularStyle(AppFontSize.xSmall, AppColors.darkTextColor, getFontFamilyFromLanguageCode()),

                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(child: const Icon(Icons.location_on_sharp , color: Colors.blue,), onTap: (){},),
                              Text(
                                studentModel.student.address,
                                style: regularStyle(AppFontSize.xSmall,  Colors.blue, getFontFamilyFromLanguageCode()),

                              ),
                                                        ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton.outlined(
                                onPressed: (){},
                                icon: const Icon(Icons.done),
                              color: AppColors.successColor,
                              style: ButtonStyle(
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                    color: AppColors.successColor
                                  )
                                )
                              ),
                            ),
                            IconButton.outlined(
                                onPressed: (){},
                                icon: const Icon(Icons.close),
                              color: AppColors.errorColor,
                              style: ButtonStyle(
                                  side: MaterialStateBorderSide.resolveWith(
                                          (states) => const BorderSide(
                                          color: AppColors.errorColor
                                      )
                                  )
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
