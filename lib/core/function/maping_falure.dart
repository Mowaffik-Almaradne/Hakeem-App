//TODO As Soon As Handel Api :
// import 'package:hosptel_app/core/error/failure.dart';

// class FailureMessage {
//   final String message;
//   final int statusCode;

//   FailureMessage({required this.message, required this.statusCode});
// }

// FailureMessage mapFailureToMessage({
//   required Failure failure,
// }) {
//   switch (failure.runtimeType) {
//     case ServerFailure:
//       ServerFailure serverFailure = failure as ServerFailure;
//       {
//         {
//           switch (serverFailure.response.error.code) {
//             case 503:
//               return FailureMessage(
//                 statusCode: serverFailure.response.error.code ?? 0,
//                 message: FaluireManger.pleaseTryLater,
//               );
//             case 413:
//               return FailureMessage(
//                 statusCode: serverFailure.response.error.code ?? 0,
//                 message: FaluireManger
//                     .thePageWasNotDisplayedBecauseTheRequestEntityistooLarge,
//               );
//             case 404:
//               return FailureMessage(
//                 statusCode: serverFailure.response.error.code ?? 0,
//                 message: FaluireManger.connectionError,
//               );
//             case 400:
//               return FailureMessage(
//                 statusCode: serverFailure.response.error.code ?? 0,
//                 message: FaluireManger.connectionError,
//               );
//             case -1:
//               return FailureMessage(
//                 statusCode: serverFailure.response.error.code ?? 0,
//                 message: FaluireManger.conectionTimeOut,
//               );
//             default:
//               return FailureMessage(
//                 statusCode: serverFailure.response.error.code ?? 0,
//                 message: FaluireManger.connectionError,
//               );
//           }
//         }
//       }
//     case EmptyCacheFailure:
//       {
//         return FailureMessage(statusCode: 0, message: FaluireManger.error);
//       }
//     case OfflineFailure:
//       {
//         return FailureMessage(
//             statusCode: 0, message: FaluireManger.pleaseCheckTheNetwork);
//       }
//     default:
//       {
//         return FailureMessage(
//             statusCode: 0, message: FaluireManger.unHandledFailure);
//       }
//   }
// }