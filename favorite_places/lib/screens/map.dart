import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      // google's default location
      latitude: 37.422,
      longitude: -122.0,
      address: '',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pop(_pickedLocation);
              },
            )
        ],
      ),
      body: !widget.isSelecting
          ? null
          : GoogleMap(
              onTap: (position) {
                setState(() {
                  _pickedLocation = position;
                });
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.location.latitude,
                  widget.location.longitude,
                ),
                zoom: 16,
              ),
              //  a set data type, using curly braces
              markers: (_pickedLocation == null && widget.isSelecting)
                  // showing nothing if no picked location
                  ? {}
                  : {
                      Marker(
                        markerId: const MarkerId('m1'),
                        position: _pickedLocation ??
                            LatLng(
                              widget.location.latitude,
                              widget.location.longitude,
                            ),
                      ),
                    },
            ),
    );
  }
}
