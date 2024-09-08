// import 'dart:convert';

// import 'package:androidstudioapps/secret.dart';
// import 'package:http/http.dart' as http;

// class OpenAIservice {
//   Future<String> isArtPromptAPI(String prompt) async {
//     try {
//       final res = await http.post(
//         Uri.parse('https://api.openai.com/v1/chat/completions'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $openAIAPIKey',
//         },
//         body: jsonEncode(
//           {
//             "model": "gpt-3.5-turbo",
//             "messages": [
//               {
//                 'role': 'user',
//                 'content':
//                     'Does this message want to generate an AI image? $prompt. Answer with a Yes or No.',
//               }
//             ],
//           },
//         ),
//       );
//       print(res.body);
//       if (res.statusCode == 200) {
//         print('DONE!');
//       }
//       return 'AI';
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   Future<String> chatGPTAPI(String prompt) async {
//     return 'ChatGPT';
//   }

//   Future<String> dallEAPI(String prompt) async {
//     return 'Dall-E';
//   }
// }
