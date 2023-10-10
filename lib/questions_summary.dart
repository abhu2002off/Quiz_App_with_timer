//import "package:adv_basics/data/questions.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  bool compUseransCorrectans(data) {
    return data['user_name'] == data['correct_answer'];
  }

  final rightColor = const Color.fromARGB(255, 5, 133, 10);
  final wrongColor = const Color.fromARGB(255, 205, 19, 6);

  @override
  Widget build(BuildContext context) {
    //  LayoutBuilder(builder: (BuildContext context,BoxConstraints height){
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var deviceScreenHeight = queryData.size.height;
    // var deviceScreenWidth = queryData.size.width;
    return Scrollbar(
      thickness: 10,
      radius: const Radius.circular(10),
      trackVisibility: true,
      thumbVisibility: true,
      interactive: true,

      ///hoverThickness: 20,
      child: SizedBox(
        height: deviceScreenHeight * 0.6,
        child: SingleChildScrollView(
          child: /*ConstrainedBox(
              constraints: BoxConstraints(minHeight: height.maxHeight,),
              child: */
              Column(
            children: summaryData.map(
              (data) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30 / 2),
                              color: Color.fromARGB(255, 228, 116, 17)),
                          alignment: Alignment.center,
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: GoogleFonts.libreBaskerville(
                                fontSize: 18, color: Colors.black87),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          //-->Used Expanded to limit the width of the row(main-axis) used by child(column)
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['question'] as String,
                                style: GoogleFonts.libreBaskerville(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 249, 248, 247)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(data['user_answer'] as String,
                                        style: TextStyle(
                                            color: compUseransCorrectans(data)
                                                ? rightColor
                                                : wrongColor)),
                                  ),
                                  Icon(
                                      data['user_answer'] ==
                                              data['correct_answer']
                                          ? Icons.check
                                          : Icons.close,
                                      color: data['user_answer'] ==
                                              data['correct_answer']
                                          ? rightColor
                                          : wrongColor)
                                ],
                              ),
                              Text(data['correct_answer'] as String)
                            ],
                          ),
                        )
                      ]),
                ); //Row
              },
            ).toList(),
          ),
        ),
      ),
    );
    //}
  }
}
