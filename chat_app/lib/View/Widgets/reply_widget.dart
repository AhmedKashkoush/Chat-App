import 'package:chat_app/Model/message.dart';
import 'package:flutter/material.dart';

class ReplyWidget extends StatelessWidget {
  final Message reply;
  final String from;
  final void Function()? onClose;
  final bool isMe;
  const ReplyWidget({
    super.key,
    required this.reply,
    required this.from,
    this.onClose,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        clipBehavior: Clip.none,
        width: double.infinity,
        // constraints: BoxConstraints(
        //   maxWidth: MediaQuery.of(context).size.width * 0.7,
        //   minWidth: MediaQuery.of(context).size.width * 0.2,
        //   maxHeight: 200,
        // ),
        decoration: BoxDecoration(
          color: Colors.black12,
          // borderRadius:
          //     BorderRadius.circular(15),
          border: BorderDirectional(
            start: BorderSide(
              color: Colors.indigo.shade300,
              width: 6,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  reply.from != from ? reply.from : 'You',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade300,
                  ),
                ),
                if (onClose != null) ...[
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: onClose,
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              reply.text,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: onClose == null && isMe
                  ? const TextStyle(color: Colors.white)
                  : null,
            ),
          ],
        ));
  }
}
