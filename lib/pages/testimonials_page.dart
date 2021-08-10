import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/models/testimonial.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Testimonial> allTestimonials = [
  Testimonial(
    text:
        "This is a testimonial text from Saad Mujeeb. Rashid is a professional at what he does and never ceases to amaze me with his beautiful works. I will like to work with him in the future again.",
    occupation: "CEO IsaaTech",
    personName: "SAAD MUJEEB",
    profilePhoto:
        "https://scontent.fkhi4-1.fna.fbcdn.net/v/t31.18172-8/10989230_10202588311147770_7304844486081199964_o.jpg?_nc_cat=103&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeH6JEuX7AYI8b_cdfzvFszyv92IRnxqezq_3YhGfGp7OmX0GrclCovlkyVjfbtx0FYRe9TcLE4P9jTmadJfozw0&_nc_ohc=LTHDmtsm0XUAX9V0Azn&_nc_ht=scontent.fkhi4-1.fna&oh=a04ba873bada8cf35f3c907297356ba2&oe=612BAF6A",
  ),
  Testimonial(
    text:
        "Rashid is a young professional with special set of skills and passion. I find him very fascinating how he manage to keep his learning consistent. I personally have worked with him regarding Android and MERN stack development and would highly recommend him for his expertise in technologies mentioned above.",
    occupation: "MERN Stack Developer",
    personName: "MUZAMMIL NAWAZ",
    profilePhoto:
        "https://scontent.fkhi4-2.fna.fbcdn.net/v/t1.6435-9/133366322_2859342830950543_7865627328469365281_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=ad2b24&_nc_eui2=AeHSutzNK0Gi6OffeN-_sfNcxZ2gcOywNqTFnaBw7LA2pJPU_1Pp5bMsGZCO6RnfLtAJSSJWTa3vHOacvznGaqqS&_nc_ohc=2q0qII1stBoAX9vaJ0d&_nc_ht=scontent.fkhi4-2.fna&oh=61c24f5c10a74ab982cb8d0707910761&oe=612BD8A9",
  ),
  Testimonial(
    text:
        "Rashid is a young professional with special set of skills and passion. I find him very fascinating how he manage to keep his learning consistent. I personally have worked with him regarding Android and MERN stack development and would highly recommend him for his expertise in technologies mentioned above.",
    occupation: "MERN Stack Developer",
    personName: "MUZAMMIL NAWAZ",
    profilePhoto:
        "https://scontent.fkhi4-2.fna.fbcdn.net/v/t1.6435-9/133366322_2859342830950543_7865627328469365281_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=ad2b24&_nc_eui2=AeHSutzNK0Gi6OffeN-_sfNcxZ2gcOywNqTFnaBw7LA2pJPU_1Pp5bMsGZCO6RnfLtAJSSJWTa3vHOacvznGaqqS&_nc_ohc=2q0qII1stBoAX9vaJ0d&_nc_ht=scontent.fkhi4-2.fna&oh=61c24f5c10a74ab982cb8d0707910761&oe=612BD8A9",
  ),
  Testimonial(
    text:
        "Rashid is a young professional with special set of skills and passion. I find him very fascinating how he manage to keep his learning consistent. I personally have worked with him regarding Android and MERN stack development and would highly recommend him for his expertise in technologies mentioned above.",
    occupation: "MERN Stack Developer",
    personName: "MUZAMMIL NAWAZ",
    profilePhoto:
        "https://scontent.fkhi4-2.fna.fbcdn.net/v/t1.6435-9/133366322_2859342830950543_7865627328469365281_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=ad2b24&_nc_eui2=AeHSutzNK0Gi6OffeN-_sfNcxZ2gcOywNqTFnaBw7LA2pJPU_1Pp5bMsGZCO6RnfLtAJSSJWTa3vHOacvznGaqqS&_nc_ohc=2q0qII1stBoAX9vaJ0d&_nc_ht=scontent.fkhi4-2.fna&oh=61c24f5c10a74ab982cb8d0707910761&oe=612BD8A9",
  ),
  Testimonial(
    text:
        "Rashid is a young professional with special set of skills and passion. I find him very fascinating how he manage to keep his learning consistent. I personally have worked with him regarding Android and MERN stack development and would highly recommend him for his expertise in technologies mentioned above.",
    occupation: "MERN Stack Developer",
    personName: "MUZAMMIL NAWAZ",
    profilePhoto:
        "https://scontent.fkhi4-2.fna.fbcdn.net/v/t1.6435-9/133366322_2859342830950543_7865627328469365281_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=ad2b24&_nc_eui2=AeHSutzNK0Gi6OffeN-_sfNcxZ2gcOywNqTFnaBw7LA2pJPU_1Pp5bMsGZCO6RnfLtAJSSJWTa3vHOacvznGaqqS&_nc_ohc=2q0qII1stBoAX9vaJ0d&_nc_ht=scontent.fkhi4-2.fna&oh=61c24f5c10a74ab982cb8d0707910761&oe=612BD8A9",
  ),
  Testimonial(
    text:
        "Rashid is a young professional with special set of skills and passion. I find him very fascinating how he manage to keep his learning consistent. I personally have worked with him regarding Android and MERN stack development and would highly recommend him for his expertise in technologies mentioned above.",
    occupation: "MERN Stack Developer",
    personName: "MUZAMMIL NAWAZ",
    profilePhoto:
        "https://scontent.fkhi4-2.fna.fbcdn.net/v/t1.6435-9/133366322_2859342830950543_7865627328469365281_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=ad2b24&_nc_eui2=AeHSutzNK0Gi6OffeN-_sfNcxZ2gcOywNqTFnaBw7LA2pJPU_1Pp5bMsGZCO6RnfLtAJSSJWTa3vHOacvznGaqqS&_nc_ohc=2q0qII1stBoAX9vaJ0d&_nc_ht=scontent.fkhi4-2.fna&oh=61c24f5c10a74ab982cb8d0707910761&oe=612BD8A9",
  ),
  Testimonial(
    text:
        "Rashid is a young professional with special set of skills and passion. I find him very fascinating how he manage to keep his learning consistent. I personally have worked with him regarding Android and MERN stack development and would highly recommend him for his expertise in technologies mentioned above.",
    occupation: "MERN Stack Developer",
    personName: "MUZAMMIL NAWAZ",
    profilePhoto:
        "https://scontent.fkhi4-2.fna.fbcdn.net/v/t1.6435-9/133366322_2859342830950543_7865627328469365281_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=ad2b24&_nc_eui2=AeHSutzNK0Gi6OffeN-_sfNcxZ2gcOywNqTFnaBw7LA2pJPU_1Pp5bMsGZCO6RnfLtAJSSJWTa3vHOacvznGaqqS&_nc_ohc=2q0qII1stBoAX9vaJ0d&_nc_ht=scontent.fkhi4-2.fna&oh=61c24f5c10a74ab982cb8d0707910761&oe=612BD8A9",
  ),
  Testimonial(
    text:
        "Rashid is a young professional with special set of skills and passion. I find him very fascinating how he manage to keep his learning consistent. I personally have worked with him regarding Android and MERN stack development and would highly recommend him for his expertise in technologies mentioned above.",
    occupation: "MERN Stack Developer",
    personName: "MUZAMMIL NAWAZ",
    profilePhoto:
        "https://scontent.fkhi4-2.fna.fbcdn.net/v/t1.6435-9/133366322_2859342830950543_7865627328469365281_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=ad2b24&_nc_eui2=AeHSutzNK0Gi6OffeN-_sfNcxZ2gcOywNqTFnaBw7LA2pJPU_1Pp5bMsGZCO6RnfLtAJSSJWTa3vHOacvznGaqqS&_nc_ohc=2q0qII1stBoAX9vaJ0d&_nc_ht=scontent.fkhi4-2.fna&oh=61c24f5c10a74ab982cb8d0707910761&oe=612BD8A9",
  ),
];

class TestimonialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                "TESTIMONIALS",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  height: 1.3,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "This is section contains some testimonials from worthy people I have worked with.",
                        style: TextStyle(color: Colors.white, height: 1.8),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.vertical,
                // Lets map
                children: allTestimonials.map((testimonial) {
                  return Expanded(
                    flex: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(bottom: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/quote.png",
                              width: 40.0,
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            testimonial.text,
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.8,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(
                                  testimonial.profilePhoto,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    testimonial.personName,
                                    style: GoogleFonts.oswald(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    testimonial.occupation,
                                    style: TextStyle(
                                      color: kCaptionColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    ),
  );
}
