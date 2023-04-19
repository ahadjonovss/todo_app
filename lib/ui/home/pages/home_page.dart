import 'package:todo_app/utils/tools/file_importer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Column(
          children:   [
            const CustomAppBar(),
            Container(
              width: width(context),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today",style: AppTextStyles.headlineMedium(context),),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 4,right: 10),
                      height: height(context)*0.06,
                      width: width(context),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: height(context)*0.024,
                            width: height(context)*0.024,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey
                              )
                            ),
                          ),
                          Text("07.00 AM",style: AppTextStyles.headlineSmall(context,color: Colors.grey,fontSize: 14),),
                          SizedBox(
                            width: width(context)*0.5,
                            child: Text("Go jogging with Christin",style: AppTextStyles.headlineLarge(context,color: AppColors.c554E8F,fontWeight: FontWeight.w600,fontSize: 16),),
                          ),
                          SvgPicture.asset(AppIcons.notificationOff,width: 20.h,)


                        ],
                      ),
                    ),
                  )
                ],
              ),
            )

      ],
    ),
    ),
    );
  }
}
