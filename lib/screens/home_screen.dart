import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthypet/models/service_model.dart';
import 'LoginPage.dart';

var selectedService = 0;
var menus = [
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user,
];
var selectedMenu = 0;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  void _navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          registeredEmail: '',
          registeredPassword: '',
          registeredFirstName: '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _bottomNavigationBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _greetings(),
              const SizedBox(
                height: 16,
              ),
              _card(),
              const SizedBox(
                height: 20,
              ),
              _search(),
              const SizedBox(
                height: 20,
              ),
              _services(),
              const SizedBox(
                height: 27,
              ),
              Text(
                'Anda Harus Login Terlebih Dahulu :)',
                style: GoogleFonts.manrope(
                  color: const Color.fromARGB(255, 60, 54, 244),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) =>
      BottomNavigationBar(
        selectedItemColor: const Color(0xFF818AF9),
        type: BottomNavigationBarType.fixed,
        items: menus
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
            .toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Color.fromARGB(255, 161, 7, 7),
        onTap: (index) {
          if (index == menus.indexOf(FeatherIcons.user)) {
            _navigateToLogin(context);
          }
        },
      );

  SizedBox _services() {
    return SizedBox(
      height: 36 +
          16, // Tambahkan tinggi untuk teks 'Anda harus Login terlebih dahulu'
      child: Column(
        children: [
          Container(
            height: 36,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: selectedService == index
                      ? const Color(0xFF818AF9)
                      : const Color(0xFFF6F6F6),
                  border: selectedService == index
                      ? Border.all(
                          color: const Color(0xFFF1E5E5).withOpacity(.22),
                          width: 2,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    Service.all()[index],
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: selectedService == index
                          ? Colors.white
                          : const Color(0xFF3F3E3F).withOpacity(.3),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: Service.all().length,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            FeatherIcons.search,
            color: Color(0xFFADACAD),
          ),
          hintText: "Find best vaccinate, treatment...",
          hintStyle: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFCACACA),
            height: 150 / 100,
          ),
        ),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFF818AF9),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_card.png',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Your ",
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        color: const Color(0xFFDEE1FE),
                        height: 150 / 100,
                      ),
                      children: const [
                        TextSpan(
                          text: "Catrine ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(text: "will get\nvaccination "),
                        TextSpan(
                          text: "tomorrow \nat 07.00 am!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.4),
                      border: Border.all(
                        color: Colors.white.withOpacity(.12),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "See details",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hey There!',
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF3F3E3F),
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  FeatherIcons.shoppingBag,
                  color: Color(0xFF818AF9),
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF6497),
                    borderRadius: BorderRadius.circular(15 / 2),
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style: GoogleFonts.mPlus1p(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
