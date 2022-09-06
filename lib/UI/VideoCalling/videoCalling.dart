import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallingAction extends StatefulWidget {
  const VideoCallingAction({
    Key? key,
  }) : super(key: key);
  @override
  State<VideoCallingAction> createState() => _VideoCallingActionState();
}

class _VideoCallingActionState extends State<VideoCallingAction> {
  String? channelName;
  @override
  Widget build(BuildContext context) {
    final AgoraClient _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: 'f7129ef4ef9942688b6034db5665b52a',
        tempToken:
            '006f7129ef4ef9942688b6034db5665b52aIACPb0TiQFdNoBrL+mwNrb1G8/CnChCMD6LnXA1CJK6TZPfJ2+cAAAAAEAD2d1R1meQOYwEAAQApoQ1j',
        channelName: 'nest',
      ),
      enabledPermission: [Permission.camera, Permission.microphone],
      agoraEventHandlers: AgoraRtcEventHandlers(
        leaveChannel: (state) => Navigator.pop(context),
      ),
    );
    Future<void> _initAgora() async {
      await _client.initialize();
    }

    void initState() {
      // TODO: implement initState
      super.initState();
      _initAgora();
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: _client,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
              ),
              AgoraVideoButtons(
                client: _client,
                enabledButtons: const [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleMic
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
