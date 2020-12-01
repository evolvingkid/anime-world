
import 'package:animeworld/core/models/animeWorldModel.dart';
import 'package:flutter/material.dart';

class AvalibilityContent extends StatelessWidget {
  AvalibilityContent({@required this.data, this.onStreamingPressed});

  final AnimeModels data;
  final Function(AnimeModels animeData) onStreamingPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RaisedButton(
            elevation: 0.0,
            onPressed: () => onStreamingPressed(data),
            child: Text("Stream Episode",
                style: Theme.of(context).textTheme.button),
          ),
        ],
      ),
    );
  }
}