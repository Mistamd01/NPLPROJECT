// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayer extends StatefulWidget {
//   const VideoPlayer(VideoPlayerController controller, { Key? key }) : super(key: key);

//   @override
//   _VideoPlayerState createState() => _VideoPlayerState();
// }

// class _VideoPlayerState extends State<VideoPlayer> {
//   late VideoPlayerController _controller;
// late Future <void> _video;
//   @override
//   void initState(){
//     super.initState();
//     _controller = VideoPlayerController.network("https://app.fmysdenterprisetraining.com.ng/uploads/727506252RespectForThatBoyShorts.mp4");
//     _video = _controller.initialize();
//   }



//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _video,
//         builder: (context, snapshot){
// if(snapshot.connectionState==ConnectionState.done){
//   return AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller));
// }
// else{
//   return Center(
//     child: CircularProgressIndicator(),
//   );
// }
//       }
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           if(_controller.value.isPlaying){
//             setState(() {
//               _controller.pause();
//             });
//           }
//           else{
//             setState(() {
//               _controller.play();
//             });
//           }
//         },
//         child: Icon(_controller.value.isPlaying?Icons.pause : Icons.play_arrow),
//         ),

        
//     );
//   }
// }

 import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'checkBox.dart';
import 'elearning2.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

 class Video extends StatefulWidget {
   const Video( { Key? key }) : super(key: key);
 
   @override
   _VideoState createState() => _VideoState();
 }
 Map? mapResponse;
List? listResponse;
 class _VideoState extends State<Video> {


String fileurl = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";

final notification = [
  CheckBoxState(title: "Mark Attendace"),
];

 bool isLoading = true;
  Future fetchPost() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://app.fmysdenterprisetraining.com.ng/api/user/courselist?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBwLmZteXNkZW50ZXJwcmlzZXRyYWluaW5nLmNvbS5uZ1wvYXBpXC9sb2dpbiIsImlhdCI6MTY0NTAxODc2MCwiZXhwIjoxNjQ1MDIyMzYwLCJuYmYiOjE2NDUwMTg3NjAsImp0aSI6Im4ydEY0QXdPaHA2MkVDamIiLCJzdWIiOjEsInBydiI6ImViMzViMjUwYmMyNmVmOGFmODYyYWM3Yjg0NDU5OWQ1NzVlMTdlNWQifQ.xRWm4hayCF2u_AIs86Qr5FHejeiqF-PmsYujPv3Kb2g"));

    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        print('-----------');
        print(response.body);
        isLoading=false;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!["data"];
      });
    }
  }

 
late VideoPlayerController _controller;
late Future <void> _initializeVideoPlayerFuture;
  @override
   void initState(){
       fetchPost();
       //https://app.fmysdenterprisetraining.com.ng/uploads/727506252RespectForThatBoyShorts.mp4
       _controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
       _initializeVideoPlayerFuture = _controller.initialize();
       _controller.setLooping(true);
       _controller.setVolume(1.0);
   
     super.initState();
   }
@override

void dispose(){
  _controller.dispose();
  super.initState();
}
   @override
   Widget build(BuildContext context) {
     return Scaffold(
  appBar: AppBar(
    centerTitle: true,
         title: Text("Selected course", style: TextStyle(color: Colors.black),),
                backgroundColor: Colors.white,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LearnTwo()));
                    })),
       body: SingleChildScrollView(
         child: Column(
             children: [
                 Container(
                     child: FutureBuilder(
                     future: _initializeVideoPlayerFuture,
                     builder: (context, snapshot){
                       if(snapshot.connectionState == ConnectionState.done){
                         return AspectRatio(aspectRatio: _controller.value.aspectRatio,
                         child: VideoPlayer(_controller),
                         );
                       }else{
                         return Center(
                           child: CircularProgressIndicator(),
                         );
                       }
                      },
                      ),
                   ),
               
               

SizedBox(height: 50),

              Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
            //    decoration: BoxDecoration(
            // border: Border.all(color: Colors.green)
         // ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("National Leadership Dialogue", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Text("Merited Category", style: TextStyle(color: Colors.black45, fontSize: 15)),
SizedBox(height: 30),
                    Text("we recognize with profound gratitude, the tireless and heroic sacrifies of many Nigerians to build a great and dynamic economy, withing a free, democratic and noble society", style: TextStyle(fontSize: 15, color: Colors.black45),)
                  ],
                ),
              ),
            ),
          ),
// Padding(
//   padding: const EdgeInsets.all(10.0),
 Container(
   child: Column(
    
      children: [ ...notification.map(buildSingleCheckbox).toList(),],
    
    //),
),
 ),

 SizedBox(height: 40),
   Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       ElevatedButton(

          style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 18),
          ),
                             onPressed: () async {
                                Map<Permission, PermissionStatus> statuses = await [
                                    Permission.storage, 
                                    //add more permission to request here.
                                ].request();

                                if(statuses[Permission.storage]!.isGranted){ 
                                    var dir = await DownloadsPathProvider.downloadsDirectory;
                                    if(dir != null){
                                          String savename = "file.mp4";
                                          String savePath = dir.path + "/$savename";
                                          print(savePath);
                                          //output:  /storage/emulated/0/Download/banner.png

                                          try {
                                              await Dio().download(
                                                
                                                  fileurl, 
                                                  savePath,
                                                  onReceiveProgress: (received, total) {
                                                      if (total != -1) {
                                                         // print((received / total * 100).toStringAsFixed(0) + "%");
                                                          //you can build progressbar feature too
                                         
                                                           Fluttertoast.showToast(
        msg:  ((received / total * 100).toStringAsFixed(0) + "%"),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 10,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 30.0,);

                                                      }
                                                    });
                                               print("File is saved to download folder.");  
                                         } on DioError catch (e) {
                                           print(e.message);
                                         }
                                    }
                                }else{
                                   print("No permission to read and write.");
                                }

                             },
                             child: Text("Download video.", style: TextStyle(fontSize: 20)),
                          ),
     ],
   )

                 ],
             ),
          ),
   
         
         
         
         
         
         
       floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.green,
         onPressed: (){
           setState(() {
             if(_controller.value.isPlaying){
               _controller.pause();
             }else{
               _controller.play();
             }
           });
         },
         child: Icon(_controller.value.isPlaying ? Icons.pause: Icons.play_arrow),),
     );
   }

   Widget buildSingleCheckbox( CheckBoxState checkbox)=>  CheckboxListTile(
                 controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.green,
                  value: checkbox.value,
                  title: Text( checkbox.title),
                  onChanged: (value) => setState(() => checkbox.value = value!),
                );
 }