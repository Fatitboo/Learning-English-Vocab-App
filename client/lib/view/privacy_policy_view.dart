import 'package:client/common/app_color.dart';
import 'package:flutter/material.dart';


class PrivacyPolicyView extends StatelessWidget {
  final String title_1 = "Conditions of user";
  final String value_1 = "Use of the Service is void where prohibited. The Service is intended for users 13 years of age or older, but is open to all ages. For children under 13 years of age (or such other age as required by local law), we provide a limited set of features and website experiences, some of which are excluded. By using the Services, you represent and warrant that (a) any registration information you submit is true and accurate; (b) you will maintain the accuracy of this information; and (c) your use of the Services does not violate any applicable law or regulation.";
  final String title_2 = "Your Account and Data";
  final String value_2 = "If you create an account on the Service, you are responsible for maintaining the security of your account and data, and you are fully responsible for all activities that occur under the account. Accounts are for individuals, not organizations, and can only be used by one person. You may not share your account with anyone else. You must notify us immediately of any unauthorized use of your data, your account or any other breach of security. We will not be liable for any acts or omissions by you, including any losses incurred as a result of such acts or omissions. We may set limits on the storage of your data over time, or use any other measures we deem reasonable to manage the Services. The policy regarding the provision of commercial content or the display of advertising may also be changed from time to time, and may be made without notice.";
  final String title_3 = "Responsibilities of Contributors";
  final String value_3 = "If you create collections, comment on message boards, post material to the Service, post links to the Service or otherwise make material available through the Service (collectively, \"Content\"), You are solely responsible for the content and all hazards arising from such Content. That is the case regardless of whether the Content in question constitutes text, graphics, an audio file, computer software or any other format in which we store data.";
  final String title_4 = "Responsibility of Users of the Service";
  final String value_4 = "We have not reviewed, and cannot review, all of the Content posted to the Service and cannot therefore be responsible for the content, use or effects of that material. By operating the Service, we do not represent or imply that we endorse the Content there posted or that we believe such material to be accurate, useful or non-harmful. You are responsible for taking precautions as necessary to protect yourself and your computer systems from viruses, worms, Trojan horses and other harmful or destructive materials. The Services may contain material that is offensive, indecent or otherwise objectionable, as well as Content which may contain technical errors, factual inaccuracies, other inaccuracies, or typographical errors. and other errors. The Services may also contain Content that violates or infringes upon the intellectual property and other proprietary rights of third parties, or the downloading, copying or use of which may be subject to additional terms and conditions. stated or unspecified. We disclaim any responsibility for any damages arising from your use of the Service or downloading of Content thereon. If you discover Content or other material that violates these Terms or our Community Guidelines, you are encouraged to report the Content to the app using the reporting functions available on the Service .";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0, // Loại bỏ đường viền bóng của AppBar
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Privacy Policy",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 30),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Item(title_1, value_1),
                Item(title_2, value_2),
                Item(title_3, value_3),
                Item(title_4, value_4),
              ],
            ),
          ),
        )
    );
  }

  Widget Item(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w300
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            value,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w100
            ),
          )
        ],
      ),
    );
  }
}