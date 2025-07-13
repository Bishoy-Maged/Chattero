import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

class MessageBubble extends StatelessWidget {
  const MessageBubble.first({
    super.key,
    required this.userImage,
    required this.username,
    required this.message,
    required this.isMe,
    this.time,
  }) : isFirstInSequence = true;

  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
    this.time,
  })  : isFirstInSequence = false,
        userImage = null,
        username = null;

  final bool isFirstInSequence;
  final String? userImage;
  final String? username;
  final String message;
  final bool isMe;
  final String? time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (isFirstInSequence && userImage != null && username != null) {
      // New layout: avatar on the left, username above bubble, both in a row
      return Container(
        margin: EdgeInsets.only(
          left: isMe ? 60 : 10,
          right: isMe ? 10 : 60,
          top: 18,
          bottom: 4,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isMe) ...[
              _buildUserImage(userImage!, theme),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    _buildBubble(theme),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 4, right: 4),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          time ?? '12:34',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (isMe) ...[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      username!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 2),
                    _buildBubble(theme),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 4, right: 4),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          time ?? '12:34',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              _buildUserImage(userImage!, theme),
            ],
          ],
        ),
      );
    }
    // For next messages, add margin to align with avatar
    return Container(
      margin: EdgeInsets.only(
        left: isMe ? 60 : 38, // 12 (avatar radius) * 2 + 14 (gap/padding)
        right: isMe ? 38 : 60,
        top: 4,
        bottom: 4,
      ),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: _buildBubble(theme),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 4, right: 4),
            child: Align(
              alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
              child: Text(
                time ?? '12:34',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBubble(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: isMe
            ? theme.colorScheme.primary.withOpacity(0.85)
            : theme.colorScheme.secondary.withOpacity(0.85),
        borderRadius: BorderRadius.only(
          topLeft: !isMe && isFirstInSequence
              ? Radius.zero
              : const Radius.circular(18),
          topRight: isMe && isFirstInSequence
              ? Radius.zero
              : const Radius.circular(18),
          bottomLeft: const Radius.circular(18),
          bottomRight: const Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      constraints: const BoxConstraints(maxWidth: 260),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Text(
        message,
        style: TextStyle(
          height: 1.4,
          color: isMe ? Colors.white : theme.colorScheme.onSecondary,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildUserImage(String image, ThemeData theme) {
    if (image.startsWith('http')) {
      return CircleAvatar(
        backgroundImage: NetworkImage(image),
        backgroundColor: theme.colorScheme.primary.withAlpha(180),
        radius: 16,
      );
    } else {
      try {
        Uint8List bytes = base64Decode(image);
        return CircleAvatar(
          backgroundImage: MemoryImage(bytes),
          backgroundColor: theme.colorScheme.primary.withAlpha(180),
          radius: 16,
        );
      } catch (e) {
        return CircleAvatar(
          backgroundColor: theme.colorScheme.primary.withAlpha(180),
          radius: 16,
          child: Icon(Icons.error, color: Colors.white),
        );
      }
    }
  }
} 