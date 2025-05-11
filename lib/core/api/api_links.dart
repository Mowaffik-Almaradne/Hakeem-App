//! all api links

//? Api GET
class ApiGet {
  static const subUrl = "services/app/";
  //? Profile :
  static const getpatientProfileUrl = "${subUrl}Patient/GetPatientProfile";
  //?
  //? Doctor :
  static const getAboutDoctoreUrl = "${subUrl}AboutDoctor/GetAboutDoctor";
  static const getAllWorkHoursForDoctorUrl =
      "${subUrl}UserWorkHour/GetAllWorkHoursForDoctor";
  //? Services
  static const getAllServices = "${subUrl}Service/GetAllForMobile";
  //? advertisement
  static const getAllAdvertisement = "${subUrl}Advertisement/GetAll";
  //? Reservation :
  static const getAllAvailableDays = "${subUrl}Day/GetAllAvailableDays";
  static const getAllAvailableTimesForDay =
      "${subUrl}Day/GetAllAvailableTimesForDay";
  static const getAllMyReservation = "${subUrl}Appointment/GetAllForPatient";

  //? Symptom :
  static const getAllSymptom = "${subUrl}Symptom/GetAll";
  //? Health :
  static const getAllmedicalSessionUrl =
      "${subUrl}MedicalSession/GetAllForPatient";
  static const getAllPatientAttachmnetUrl =
      "${subUrl}PatientAttachmnet/GetAllForPatient";
  static const getAllprescriptionUrl = "${subUrl}Prescription/GetAllForPatient";
  static const getAllprescriptionDetailsUrl =
      "${subUrl}PrescriptionItem/GetAll";
  static const getAllAccountsForPatientUrl =
      "${subUrl}PatientAccount/GetAllAccountsForPatient";

  //? Notification :
  static const getAllPatientNotification =
      "${subUrl}PatientNotification/GetAllForPatient";
}
//?

//? Api POST
class ApiPost {
  static const subUrl = "services/app/";
  //? Auth
  static const createAccount = "${subUrl}Account/RegisterPatient";
  static const login = "TokenAuth/AuthenticatePatient";
  static const confirmPatientAccount = "${subUrl}Account/ConfirmPatientAccount";
  static const resendCodeUrl = "${subUrl}Account/ResendCode";
  static const forgetPasswordPhone = "${subUrl}Patient/ForgotPassword";
  static const confirmForgetPassword =
      "${subUrl}Patient/ConfirmForgotPasswordCode";
  static const resetPasswordUrl = "${subUrl}Patient/ResetPassword";

  //? Profile :
  static const changePasswordUrl = "${subUrl}Patient/ChangePassword";
  static const sendConfirmationCodeForEditNumberUrl =
      "${subUrl}Patient/SendConfirmationCode5ForEditNumber";
  static const confirmEditPhoneNumberUrl =
      "${subUrl}Patient/ConfirmEditPhoneNumber";
  static const logoutUrl = "${subUrl}Patient/Logout";
  //? Reservation :
  static const createAppointmentUrl =
      "${subUrl}Appointment/CreateAppointmentByPatient";

  //? Notification:
  static const setNotificationsAsReadedUrl =
      "${subUrl}PatientNotification/SetNotificationsAsReaded";
}
//

//? Api PUT
class ApiPut {
  static const subUrl = "services/app/";
  static const updatapatientProfileUrl =
      "${subUrl}Patient/UpdatePatientProfile";
}
//?

//? Api DELETE
class ApiDelete {
  static const subUrl = "services/app/";
  //? Profile :
  static const deleteAccountUrl = "${subUrl}Patient/DeletePatientAccount";
}
//?
