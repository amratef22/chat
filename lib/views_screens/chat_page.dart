import 'package:chaty_app/componants/constants.dart';
import 'package:chaty_app/models/message_model.dart';
import 'package:chaty_app/widgets/chat_bubule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {

  static String id = 'ChatScreen';

  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt).snapshots(),
        builder: (context, snapshot)
        {
          if(snapshot.hasData)
          {
            List<Message> messagesList = [];
            for(int i=0; i< snapshot.data!.docs.length; i++)
            {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('chat'),
                centerTitle: true,
              ),
              body: Column(
                children:
                [
                  Expanded(
                    child: ListView.builder(
                      controller:_controller ,
                      itemCount: messagesList.length,
                      itemBuilder:(context, index)
                    {
                      return messagesList[index].id==email ?
                      ChatBuble(
                        messageModel: messagesList[index],
                      ):ChatBubleFriend(messageModel: messagesList[index]);
                    }),

                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data)
                      {

                        messages.add({
                          kMessage:data,
                          kCreatedAt: DateTime.now(),
                          'id':email,
                        });
                        controller.clear();
                        _controller.animateTo(
                          _controller.position.maxScrollExtent,
                          duration: const Duration(milliseconds:500),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Send Massage',
                        suffixIcon: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }else
          {
            return Text('loading...');
          }
        },
    );
  }
}


