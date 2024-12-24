import 'package:coachinho/core/data/models/user.dart';
import 'package:coachinho/core/data/users_data.dart';
import 'package:coachinho/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final User user = UsersData.data.first;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Color(0xff030605), Color(0xff092c23)])),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontStyle: FontStyle.italic),
                        ),
                        const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 36,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(user.overall.toString(),
                                style: const TextStyle(
                                    fontSize: 56,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    height: 0,
                                    fontWeight: FontWeight.w800)),
                            Text(user.position,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    height: 0,
                                    fontStyle: FontStyle.italic)),
                          ],
                        )),
                        const SizedBox(
                          width: 45,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(48)),
                            child: CircleAvatar(
                                radius: 48,
                                backgroundImage: AssetImage(user.avatar))),
                        const SizedBox(
                          width: 45,
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/star_yellow.png',
                              width: 75,
                              height: 75,
                            ),
                            Positioned(
                                bottom: 6,
                                right: 10,
                                child: Text(
                                  'Lv.${user.level - 1}',
                                  style: const TextStyle(fontSize: 8),
                                ))
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              width: 100,
                              height: 100,
                            ),
                            Positioned(
                                bottom: 8,
                                right: 12,
                                child: Text(
                                  'Lv.${user.level}',
                                  style: const TextStyle(fontSize: 9),
                                ))
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          'assets/images/lock.png',
                          width: 75,
                          height: 75,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Level ${user.level}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700),
                        ),
                        const Expanded(child: SizedBox()),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          Utils.formatNum(user.point),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          ' of ${Utils.formatNum(15000)}',
                          style: const TextStyle(
                              color: Color(0xff6f7775),
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2)),
                        child: LinearProgressIndicator(
                          backgroundColor: const Color(0xff6f7775),
                          color: const Color(0xff78f27f),
                          value: user.point / 15000,
                        )),
                    const SizedBox(
                      height: 60,
                    ),
                    // Skills Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Skill Ratings',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic)),
                        TextButton(
                          onPressed: () {},
                          child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: const [
                                Text('See more',
                                    style: TextStyle(
                                        color: Color(0xff6f7775),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.white,
                                )
                              ]),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.count(
                      padding: EdgeInsets.zero,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 40,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: 3,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/speedometer-icon.svg',
                                  color: Colors.white,
                                  width: 18,
                                  height: 18,
                                ),
                                const Text(' Speed',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                            Row(
                              children: [
                                Text(user.speed.round().toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffb5b5b5),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            child: LinearProgressIndicator(
                                              minHeight: 14,
                                              backgroundColor:
                                                  const Color(0xffb5b5b5),
                                              color: const Color(0xff1a5c4a),
                                              value: user.speed / 100,
                                            ))))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/feather-icon.svg',
                                  color: Colors.white,
                                  width: 18,
                                  height: 18,
                                ),
                                const Text(' Agility',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                            Row(
                              children: [
                                Text(user.speed.round().toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffb5b5b5),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            child: LinearProgressIndicator(
                                              minHeight: 14,
                                              backgroundColor:
                                                  const Color(0xffb5b5b5),
                                              color: const Color(0xff1a5c4a),
                                              value: user.speed / 100,
                                            ))))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/football-icon.svg',
                                  color: Colors.white,
                                  width: 18,
                                  height: 18,
                                ),
                                const Text(' Dribbling',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                            Row(
                              children: [
                                Text(user.speed.round().toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffb5b5b5),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            child: LinearProgressIndicator(
                                              minHeight: 14,
                                              backgroundColor:
                                                  const Color(0xffb5b5b5),
                                              color: const Color(0xff1a5c4a),
                                              value: user.speed / 100,
                                            ))))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/magic-wand-icon.svg',
                                  color: Colors.white,
                                  width: 18,
                                  height: 18,
                                ),
                                const Text(' Ball Handling',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                            Row(
                              children: [
                                Text(user.speed.round().toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffb5b5b5),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            child: LinearProgressIndicator(
                                              minHeight: 14,
                                              backgroundColor:
                                                  const Color(0xffb5b5b5),
                                              color: const Color(0xff1a5c4a),
                                              value: user.speed / 100,
                                            ))))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/wind-icon.svg',
                                  color: Colors.white,
                                  width: 18,
                                  height: 18,
                                ),
                                const Text(' Stamina',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                            Row(
                              children: [
                                Text(user.speed.round().toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffb5b5b5),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            child: LinearProgressIndicator(
                                              minHeight: 14,
                                              backgroundColor:
                                                  const Color(0xffb5b5b5),
                                              color: const Color(0xff1a5c4a),
                                              value: user.speed / 100,
                                            ))))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/cursor-icon.svg',
                                  color: Colors.white,
                                  width: 18,
                                  height: 18,
                                ),
                                const Text(' Coordination',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                            Row(
                              children: [
                                Text(user.speed.round().toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffb5b5b5),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14)),
                                            child: LinearProgressIndicator(
                                              minHeight: 14,
                                              backgroundColor:
                                                  const Color(0xffb5b5b5),
                                              color: const Color(0xff1a5c4a),
                                              value: user.speed / 100,
                                            ))))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Divider(
                      height: 2,
                      color: Color(0xff2d443f),
                    ),
                    const SizedBox(
                      height: 40,
                    ), // Leaderboard Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Leaderboard',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic)),
                        TextButton(
                          onPressed: () {},
                          child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: const [
                                Text('See more',
                                    style: TextStyle(
                                        color: Color(0xff6f7775),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.white,
                                )
                              ]),
                        )
                      ],
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: UsersData.data.length,
                        itemBuilder: ((context, index) {
                          final data = UsersData.data[index];

                          return Container(
                              margin: index < UsersData.data.length - 1
                                  ? const EdgeInsets.only(bottom: 10)
                                  : EdgeInsets.zero,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: index > 0
                                          ? Colors.transparent
                                          : Colors.white,
                                      width: 2),
                                  color: index > 0
                                      ? const Color(0xff0f3e32)
                                      : Colors.black),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(8),
                                leading: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        '${index + 1}.',
                                        style: const TextStyle(
                                            color: Color(0xff6f7775),
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(36)),
                                          child: CircleAvatar(
                                              radius: 28,
                                              backgroundImage:
                                                  AssetImage(data.avatar)))
                                    ]),
                                title: Text(
                                  data.name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w700),
                                ),
                                subtitle: Wrap(
                                  spacing: 5,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      Utils.formatNum(data.point),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Image.asset(
                                      'assets/images/logo.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ));
                        }))
                  ],
                )))),
        onWillPop: () => Future.value(false));
  }
}
