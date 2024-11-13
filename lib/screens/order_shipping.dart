import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as Math;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopping_app/screens/new_bottom_navigation.dart';
import 'package:shopping_app/screens/new_home.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderShipping extends StatefulWidget {
  const OrderShipping({super.key});

  @override
  State<OrderShipping> createState() => _OrderShippingState();
}

class _OrderShippingState extends State<OrderShipping> {
  Set<Marker> markers = {};
  String? _mapStyle;

  bool _isLocServiceEnabled = true;
  bool _weHavelocation = false;
  BitmapDescriptor customIcon1 =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
  @override
  void initState() {
    // role = widget.role;
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });

    super.initState();
    serviceStatusStream =
        Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      print("=================================================");
      print(status);
      print("=================================================");

      if (status == ServiceStatus.disabled) {
        _isLocServiceEnabled = false;
      } else {
        _isLocServiceEnabled = true;
      }
      setState(() {});
      ();
    });

    // BitmapDescriptor.asset(const ImageConfiguration(size: Size(30, 30)),
    //         "assets/images/car.jpeg")
    //     .then((onValue) {
    //   customIcon1 = onValue;
    // });
  }

  Timer? _debounce;
  @override
  void dispose() {
    _debounce?.cancel();
    if (serviceStatusStream != null) serviceStatusStream!.cancel();
    super.dispose();
  }

  bool _expandBottomSheet = false;
  _onCameraMove(CameraPosition position) {
    if (_expandBottomSheet) {
      _expandBottomSheet = false;

      setState(() {});
      ();
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      pos = LatLng(position.target.latitude, position.target.longitude);

      // Marker marker = Marker(
      //     markerId: MarkerId(DateTime.now().toString()),
      //     position: LatLng(position.target.latitude, position.target.longitude),
      //     icon: BitmapDescriptor.defaultMarkerWithHue(hueList[Random().nextInt(hueList.length)]));
      // // markers.add(marker);
      // setS();
      // print("aaaaaaaaaaaaaaaaa $position ${markers.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Expanded(
              child: kIsWeb || !(Platform.isAndroid || Platform.isIOS)
                  ? const Center(child: Text("unsupport platfrom"))
                  : Stack(children: [
                      GoogleMap(
                          style: _mapStyle,
                          mapType: MapType.terrain,
                          polylines: polylines,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            mapController ??= controller;
                            // controller.setMapStyle(_mapStyle);
                            _mapController.complete(controller);
                            _genMarkers(source: sourcec, desit: destLatlnn);
                            _createPolylines(source, destLatln).then((onValue) {
                              print("_createPolylines  ${onValue.length}");
                              polylines = onValue;
                              setState(() {});
                              ();
                              // _animateDriverMarker(); // auto start fake router driver
                              changestatus();
                            }).catchError((onError) {
                              print("_createPolylines Error");
                              print(onError);
                            });
                          },
                          zoomControlsEnabled: true,
                          myLocationEnabled: false,
                          // onCameraMove: _onCameraMove,
                          markers: markers.isNotEmpty
                              ? markers
                              : {
                                  Marker(
                                    position: sourcec,
                                    markerId: MarkerId("value"),
                                  )
                                }),
                      // Align(
                      //     alignment: Alignment.center,
                      //     child: Icon(Icons.location_pin,
                      //         color: Theme.of(context).colorScheme.primary, size: 40.0))
                      Stack(children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: 400,
                                decoration: const BoxDecoration(
                                    color: Color(0xff6AD0AE),
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 60),
                                      const Text("Chicken Rice Salad x2",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white)),
                                      ...steps.asMap().entries.map((entry) {
                                        int idx = entry.key;
                                        String step = entry.value;
                                        return TimelineTile(
                                            isFirst: idx == 0,
                                            isLast: idx == steps.length - 1,
                                            axis: TimelineAxis.vertical,
                                            alignment: TimelineAlign.start,
                                            beforeLineStyle: LineStyle(
                                                color: idx <= currentStep
                                                    ? Colors.green
                                                    : Colors.white,
                                                thickness: 3),
                                            indicatorStyle: IndicatorStyle(
                                                color: idx <= currentStep
                                                    ? Colors.green
                                                    : Colors.white,
                                                width: 20),
                                            endChild: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 14.0,
                                                        horizontal: 8),
                                                child: Text(step,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: idx <=
                                                                currentStep
                                                            ? Colors.green
                                                            : Colors.white))));
                                      }).toList()
                                    ]))),
                        const Positioned(
                            bottom: 330,
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                                radius: 72, backgroundColor: Color(0xFFC8C7CC)))
                      ])
                    ]))
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewBottom()));
            },
            child: const Icon(Icons.play_arrow)));
  }

  List<String> steps = [
    'Sended request',
    'Confirmed order',
    'Shipped Received',
    'Shipping',
    'Received Food'
  ];
  int currentStep = 0;
  void changestatus() async {
    _isDriverAnimate = true;
    while (true) {
      for (int i = 0; i < steps.length; i++) {
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          currentStep = i;
        });
        await _animateDriverMarker();
      }
      _isDriverAnimate = false;
    }
  }

  static const PointLatLng source = PointLatLng(21.166780, 72.840980);
  static const PointLatLng destLatln = PointLatLng(21.165499, 72.845615);
  static const LatLng sourcec = LatLng(21.166780, 72.840980);
  static const LatLng destLatlnn = LatLng(21.165499, 72.845615);

  final List<LatLng> route = [
    const LatLng(21.166920, 72.841409),
    const LatLng(21.167000, 72.842053),
    const LatLng(21.167000, 72.842675),
    const LatLng(21.167020, 72.843222),
    const LatLng(21.167020, 72.843533),
    const LatLng(21.166890, 72.843780),
    const LatLng(21.166640, 72.843866),
    const LatLng(21.166350, 72.843984),
    const LatLng(21.165999, 72.844048),
    const LatLng(21.165910, 72.844394),
    const LatLng(21.165905, 72.845035),
    const LatLng(21.165928, 72.845443),
    const LatLng(21.165827, 72.845687),
  ];

  Set<Polyline> polylines = {};

  Future<Set<Polyline>> _createPolylines(
      PointLatLng start, PointLatLng destination) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    Set<Polyline> retLines = {};
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey:
          "", // Google Maps API Key
      request: PolylineRequest(
          origin: start, destination: destination, mode: TravelMode.driving),
    );
    print(result.errorMessage);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Theme.of(context).colorScheme.primary,
      width: 5,
      points: polylineCoordinates,
    );
    retLines.add(polyline);
    return retLines;
  }

  bool _isDriverAnimate = false;
  int add = 1;
  int i = 0;
  _animateDriverMarker() async {
    if (!_isDriverAnimate) return;
    await Future.delayed(const Duration(seconds: 2), () async {
      _genMarkers(dirver: route[i]);
      i = i + add;
      //to go back and forth on the route
      if (i + 1 == route.length) {
        add = -1;
      } else if (i - 1 == -1) {
        add = 1;
      }
      // if (_followRider && mapController != null) {
      //   mapController!.animateCamera(CameraUpdate.newLatLng(route[i]));
      // }
      if (_isDriverAnimate) _animateDriverMarker();
    });
  }

  _genMarkers({LatLng? source, LatLng? desit, LatLng? dirver, LatLng? gps}) {
    bool isUpdated = false;
    if (source != null) {
      isUpdated = true;
      Marker mark = Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          markerId: const MarkerId("source"),
          position: source);
      _udpateMyMarkerLs(mark);
    }
    if (desit != null) {
      isUpdated = true;
      Marker mark = Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: const MarkerId("desit"),
          position: desit);
      _udpateMyMarkerLs(mark);
    }
    if (dirver != null) {
      isUpdated = true;
      int index = markers
          .toList()
          .indexWhere((element) => element.markerId.value == "dirver");
      double rotation = 0;
      if (index >= 0) {
        rotation = calculateBearing(markers.elementAt(index).position, dirver);
      }
      //-180 to change the orintaiton of the marker depends on the image used
      Marker mark = Marker(
          icon: customIcon1,
          markerId: const MarkerId("dirver"),
          rotation: rotation - 180,
          position: dirver);
      _udpateMyMarkerLs(mark);
    }
    if (gps != null) {
      isUpdated = true;

      Marker mark = Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: const MarkerId("gps"),
          position: gps);
      _udpateMyMarkerLs(mark);
    }
    if (isUpdated) setState(() {});
    ();
  }

  _udpateMyMarkerLs(Marker mark) {
    int index = markers
        .toList()
        .indexWhere((element) => element.markerId.value == mark.markerId.value);
    if (index != -1) markers.remove(markers.elementAt(index));
    markers.add(mark);
  }

  double calculateBearing(LatLng startPoint, LatLng endPoint) {
    final double startLat = toRadians(startPoint.latitude);
    final double startLng = toRadians(startPoint.longitude);
    final double endLat = toRadians(endPoint.latitude);
    final double endLng = toRadians(endPoint.longitude);

    final double deltaLng = endLng - startLng;

    final double y = Math.sin(deltaLng) * Math.cos(endLat);
    final double x = Math.cos(startLat) * Math.sin(endLat) -
        Math.sin(startLat) * Math.cos(endLat) * Math.cos(deltaLng);

    final double bearing = Math.atan2(y, x);

    return (toDegrees(bearing) + 360) % 360;
  }

  double toRadians(double degrees) {
    return degrees * (Math.pi / 180.0);
  }

  double toDegrees(double radians) {
    return radians * (180.0 / Math.pi);
  }

  LatLng? pos;
  StreamSubscription<ServiceStatus>? serviceStatusStream;

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _isLocServiceEnabled = false;
      setState(() {});
      ();
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }
    _isLocServiceEnabled = true;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // var accuracy = await Geolocator.getLocationAccuracy();
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position pas = await Geolocator.getCurrentPosition();
    pos = LatLng(pas.latitude, pas.longitude);
    _kGooglePlex = CameraPosition(
        target: LatLng(pos?.latitude ?? 0, pos?.longitude ?? 0), zoom: 14.4746);
    _weHavelocation = true;
    if (mapController != null && pos != null) {
      mapController!.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(pos?.latitude ?? 0, pos?.longitude ?? 0), 16));
      markers.add(Marker(
          markerId: const MarkerId("myposi"),
          position: LatLng(pos?.latitude ?? 0, pos?.longitude ?? 0)));
      setState(() {});
      ();
    }
    return pas;
  }
// 137, balaji nagar, Infront of over head water tank, Rawatbhata, Baroli, Rajasthan 323305, India

  GoogleMapController? mapController;

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  CameraPosition _kGooglePlex =
      const CameraPosition(target: destLatlnn, zoom: 16);
}
