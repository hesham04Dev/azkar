import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/PrimaryContainer.dart';
import '../providers/zkr_provider.dart';

class ZkrContainer extends StatefulWidget {

  final Map zkr;
  final int index;
  var height;
  ZkrContainer({super.key,required this.zkr, required this.index});

  @override
  State<ZkrContainer> createState() => _ZkrState();
}

class _ZkrState extends State<ZkrContainer> {

  bool isActive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final zkrProvider = context.watch<ZkrProvider>();
    isActive = widget.index == zkrProvider.currentIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = context.size;
      zkrProvider.setZkrHeight(widget.index, size?.height ?? 0);
    });
    return
      PrimaryContainer(
       withBorder: isActive,
        padding: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${widget.zkr["name"]}"),
            Text(
              "${widget.index + 1}. ${widget.zkr['content']}",
              textAlign: TextAlign.justify,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(
                height: 1.5,
                fontFamily: 'Amiri',
              ),
            ),
            const SizedBox(height: 16),
            PrimaryContainer(
              width: double.infinity,
              margin: 0,
              padding: 0,
              child: TextButton(
                onPressed: () {
                  if (widget.zkr["repeat"] > 0) {
                    zkrProvider.onZkrRepeat(index:widget.index,notify: false);
                    setState(() {});

                  }
                  print("dd");
                  print(widget.zkr["name"]);
                },
                child: Text(
                  "${widget.zkr["repeat"]}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}

