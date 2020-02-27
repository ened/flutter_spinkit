import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("SpinKit", style: TextStyle(fontSize: 24.0)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 32,
        ),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 4 / 3,
          ),
          children: <Widget>[
            const SpinKitRotatingCircle(color: Colors.white),
            const SpinKitRotatingPlain(color: Colors.white),
            const SpinKitChasingDots(color: Colors.white),
            const SpinKitPumpingHeart(color: Colors.white),
            const SpinKitPulse(color: Colors.white),
            const SpinKitDoubleBounce(color: Colors.white),
            const SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
            const SpinKitWave(
                color: Colors.white, type: SpinKitWaveType.center),
            const SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
            const SpinKitThreeBounce(color: Colors.white),
            const SpinKitThreeInOut(color: Colors.white),
            const SpinKitWanderingCubes(color: Colors.white),
            const SpinKitWanderingCubes(
                color: Colors.white, shape: BoxShape.circle),
            const SpinKitCircle(color: Colors.white),
            const SpinKitFadingFour(color: Colors.white),
            const SpinKitFadingFour(
                color: Colors.white, shape: BoxShape.rectangle),
            const SpinKitFadingCube(color: Colors.white),
            const SpinKitCubeGrid(size: 51.0, color: Colors.white),
            const SpinKitFoldingCube(color: Colors.white),
            const SpinKitRing(color: Colors.white),
            const SpinKitDualRing(color: Colors.white),
            const SpinKitRipple(color: Colors.white),
            const SpinKitFadingGrid(color: Colors.white),
            const SpinKitFadingGrid(
                color: Colors.white, shape: BoxShape.rectangle),
            const SpinKitSquareCircle(color: Colors.white),
            const SpinKitSpinningCircle(color: Colors.white),
            const SpinKitSpinningCircle(
                color: Colors.white, shape: BoxShape.rectangle),
            const SpinKitFadingCircle(color: Colors.white),
            const SpinKitHourGlass(color: Colors.white),
            const SpinKitPouringHourglass(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
