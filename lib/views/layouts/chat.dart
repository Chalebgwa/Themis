import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/auth_provider.dart';
import 'package:simon/controllers/chat_provider.dart';
import 'package:simon/models/message.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final controller = TextEditingController();

  final focusNode = FocusNode();

  ChatProvider chatProvider;

  Auth auth;

  void sendMessage() async {
    var content = controller.text;
    var type = MessageType.TEXT;
    var sender = auth.currentUser.id;
    var reciever = "chatbot";

    await chatProvider.addMessage(reciever, sender, content, type);
    controller.clear();
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    chatProvider = Provider.of<ChatProvider>(context);
    auth = Provider.of<Auth>(context);

    return RefreshIndicator(
      color: Colors.red,
      onRefresh: () async {
        return chatProvider.getChat("recieverId", "senderId");
      },
      child: FutureBuilder<List<Message>>(
          future: chatProvider.getChat("recieverId", "senderId"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            var data = snapshot.data;

            return Container(
              width: double.infinity,
              color: Colors.white,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  Flexible(
                    flex: 3,
                    child: AnimatedList(
                      reverse: true,
                      initialItemCount: data.length,
                      itemBuilder: (context, index, animation) {
                        
                        return CardItem(
                          animation: animation,
                          item: index,
                          onTap: () {},
                          selected: true,
                        );
                      },
                    ),
                  ),
                  buildBottomBar(),
                ],
              ),
            );
          }),
    );
  }

  Card buildBottomBar() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        leading: Icon(FontAwesomeIcons.user),
        title: TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: "Send Message",
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.send),
          onPressed: sendMessage,
        ),
      ),
    );
  }
}

class Bubble extends StatefulWidget {
  const Bubble({Key key, this.isLeft = false, this.message}) : super(key: key);
  final bool isLeft;
  final Message message;

  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment:
            widget.isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Card(
            color: widget.isLeft ? Theme.of(context).accentColor : Colors.white,
            child: Container(
              margin: EdgeInsets.all(7),
              constraints: BoxConstraints(
                maxWidth: size.width * .6,
                minWidth: size.width * .3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.message.content,
                      style: TextStyle(
                        color: !widget.isLeft ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      DateFormat.Hm().format(
                          DateTime.fromMicrosecondsSinceEpoch(
                              int.parse(widget.message.timestamp))),
                      style: TextStyle(
                        color: !widget.isLeft ? Colors.black : Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected: false})
      : assert(animation != null),
        assert(item != null && item >= 0),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline4;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text('Item $item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
