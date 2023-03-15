// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart' // new
    hide
        EmailAuthProvider,
        PhoneAuthProvider; // new
import 'package:flutter/material.dart'; // new
import 'package:provider/provider.dart'; // new

import 'app_state.dart'; // new
import 'src/authentication.dart';
import 'src/widgets.dart';
import 'guest_book.dart';
import 'yes_no_selection.dart';
import 'video.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetup'),
      ),
      body: ListView(
        children: <Widget>[
          YouTubeVideoWidget(videoId: 'IFCDLIKSArs'),
          const SizedBox(height: 8),
          const IconAndDetail(Icons.calendar_today, 'March 25'),
          const IconAndDetail(Icons.location_city, 'Zug'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                }),
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const Header(
              "Und wieder ist es der 25., der wird für immer eine andere Bedeutung haben 💛"),
          const Paragraph(
            'Vielleicht gibt es wieder einen Workshop',
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.attendees >= 2)
                  Paragraph('${appState.attendees} Personen nehmen Teil')
                else if (appState.attendees == 1)
                  const Paragraph('1 Person nimmt teil')
                else
                  const Paragraph('Niemand nimmt teil'),
                if (appState.loggedIn) ...[
                  YesNoSelection(
                    state: appState.attending,
                    onSelection: (attending) => appState.attending = attending,
                  ),
                  const Header('Discussion'),
                  GuestBook(
                    addMessage: (message) =>
                        appState.addMessageToGuestBook(message),
                    messages: appState.guestBookMessages, // new
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
