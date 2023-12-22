import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    final String jsonString =
        await rootBundle.loadString('assets/l10n/${locale.languageCode}.json');

    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  String get appTitle => translate('appTitle');
  String get version => translate('version');
  String get welcomeMessage => translate('welcomeMessage');
  String get welcomeSubTitle => translate('welcomeSubTitle');
  String get username => translate('username');
  String get password => translate('password');
  String get link => translate('link');
  String get login => translate('login');
  String get forgotPassword => translate('forgotPassword');
  String greeting(String name) =>
      translate('greeting').replaceAll('{name}', name);
  String get copyrightText => translate('copyrightText');
  String get continueInEnglish => translate('continueInEnglish');
  String get contunueInArabic => translate('contunueInArabic');
  String get contunueInChinese => translate('contunueInChinese');
  String get resetPassword => translate('resetPassword');
  String get emailAddress => translate('emailAddress');
  String get linkText => translate('linkText');
  String get send => translate('send');
  String get companyAndLocation => translate('companyAndLocation');
  String get continuebtn => translate('continuebtn');
  String get selectCompany => translate('selectCompany');
  String get selectLocation => translate('selectLocation');
  String get preBookings => translate('preBookings');
  String get dailyvisitors => translate('dailyvisitors');
  String get emergencyEvacuation => translate('emergencyEvacuation');
  String get pendingApprovals => translate('pendingApprovals');
  String get preBooked => translate('preBooked');
  String get walkIn => translate('walkIn');
  String get checkoutViolators => translate('checkoutViolators');
  String get totalPreBooking => translate('totalPreBooking');
  String get male => translate('male');
  String get female => translate('female');
  String get other => translate('other');
  String get profile => translate('profile');
  String get personalInfo => translate('personalInfo');
  String get settings => translate('settings');
  String get logout => translate('logout');
  String get deleteAccount => translate('deleteAccount');
  String get fullName => translate('fullName');
  String get email => translate('email');
  String get mobileNo => translate('mobileNo');
  String get designation => translate('designation');
  String get department => translate('department');
  String get buildingName => translate('buildingName');
  String get roomNo => translate('roomNo');
  String get area => translate('area');
  String get floor => translate('floor');
  String get location => translate('location');
  String get updateProfile => translate('updateProfile');
  String get preBookingMeeting => translate('preBookingMeeting');
  String get primaryHostName => translate('primaryHostName');
  String get purpose => translate('purpose');
  String get startTime => translate('startTime');
  String get endTime => translate('endTime');
  String get sendVisitorLink => translate('sendVisitorLink');
  String get addtionalDetails => translate('addtionalDetails');
  String get listOfVisitor => translate('listOfVisitor');
  String get visitors => translate('visitors');
  String get hosts => translate('hosts');
  String get addtionalHosts => translate('addtionalHosts');
  String get save => translate('save');
  String get forThisMeeting => translate('forThisMeeting');
  String get wayFinder => translate('wayFinder');
  String get allowCheckIn => translate('allowCheckIn');
  String get checkoutNotification => translate('checkoutNotification');
  String get sendNotifiyArrival => translate('sendNotifiyArrival');
  String get sendNotifiyPrebooking => translate('sendNotifiyPrebooking');
  String get allowMultipleCheckIn => translate('allowMultipleCheckIn');
  String get visitorRegisterLink => translate('visitorRegisterLink');
  String get hostConfirmation => translate('hostConfirmation');
  String get sendLink => translate('sendLink');
  String get nameMobileEmail => translate('nameMobileEmail');
  String get showEmail => translate('showEmail');
  String get selectAll => translate('selectAll');
  String get addVisitors => translate('addVisitors');
  String get selectDepartment => translate('selectDepartment');
  String get searchByName => translate('searchByName');
  String get addHosts => translate('addHosts');
  String get addNewVisitor => translate('addNewVisitor');
  String get name => translate('name');
  String get company => translate('company');
  String get emiratesId => translate('emiratesId');
  String get nationalId => translate('nationalId');
  String get otherId => translate('otherId');
  String get gender => translate('gender');
  String get addVisitor => translate('addVisitor');
  String get notifications => translate('notifications');
  String get clearAll => translate('clearAll');
  String get approve => translate('approve');
  String get reject => translate('reject');
  String get setting => translate('setting');
  String get allowWalkinNotifiy => translate('allowWalkinNotifiy');
  String get enableKiosk => translate('enableKiosk');
  String get notifiyVisitorMeeting => translate('notifiyVisitorMeeting');
  String get visitorRegisterationEmail =>
      translate('visitorRegisterationEmail');
  String get appSettings => translate('appSettings');
  String get enableNotifications => translate('enableNotifications');
  String get darkMode => translate('darkMode');
  String get enLanguage => translate('enLanguage');
  String get arLanguage => translate('arLanguage');
  String get about => translate('about');
  String get newVersion => translate('newVersion');
  String get preBooking => translate('preBooking');
  String get searchpurpose => translate('searchpurpose');
  String get startDate => translate('startDate');
  String get endDate => translate('endDate');
  String get checkout => translate('checkout');
  String get pendingPreBooking => translate('pendingPreBooking');
  String get pendingWalkin => translate('pendingWalkin');
  String get checkoutPrebooked => translate('checkoutPrebooked');
  String get checkoutWalkin => translate('checkoutWalkin');
  String get loginsuccess => translate('loginsuccess');
  String get loginfailed => translate('loginfailed');
  String get logoutsccuess => translate('logoutsccuess');
  String get logoutfailed => translate('logoutfailed');
  String get userrequired => translate('userrequired');
  String get passwordrequired => translate('passwordrequired');
  String get urlsuccess => translate('urlsuccess');
  String get urlfailed => translate('urlfailed');
  String get urlrequired => translate('urlrequired');
  String get updatesuccess => translate('updatesuccess');
  String get updatefailed => translate('updatefailed');
  String get nointernet => translate('nointernet');
  String get activate => translate('activate');
  String get contactText => translate('contactText');
  String get welcomeLink => translate('welcomeLink');
  String get newMeeting => translate('newMeeting');
  String get dashboard => translate('dashboard');
  String get currentStatus => translate('currentStatus');
  String get checkinVisitor => translate('checkinVisitor');
  String get room => translate('room');
  String get total => translate('total');
  String get meetingDetials => translate('meetingDetials');
  String get search => translate('search');
  String get findVisitor => translate('findVisitor');
  String get findHost => translate('findHost');
  String get meetingSetting => translate('meetingSetting');
  String get delete => translate('delete');
  String get update => translate('update');
  String get filter => translate('filter');
  String get apply => translate('apply');
  String get clear => translate('clear');
  String get walkInVisitor => translate('walkInVisitor');
  String get preBookedVisitor => translate('preBookedVisitor');
  String get logs => translate('logs');
  String get servererror => translate('servererror');
  String get approved => translate('approved');
  String get pending => translate('pending');
  String get ok => translate('ok');
  String get nodataTitle => translate('nodataTitle');
  String get nodataDesc => translate('nodataDesc');
  String get reloadData => translate('reloadData');
  String get approvalkeyRequired => translate('approvalkeyRequired');
  String get hostrequired => translate('hostrequired');
  String get startdaterequired => translate('startdaterequired');
  String get enddaterequired => translate('enddaterequired');
  String get meetingsuccess => translate('meetingsuccess');
  String get meetingfailed => translate('meetingfailed');
  String get sendsuccess => translate('sendsuccess');
  String get sendfailed => translate('sendfailed');
  String get meetingDeletesuccess => translate('meetingDeletesuccess');
  String get meetingDeletefailed => translate('meetingDeletefailed');
  String get country => translate('country');
  String get state => translate('state');
  String get confirmRemove => translate('confirmRemove');
  String get confirmRemoveDesc => translate('confirmRemoveDesc');
  String get confirmUserRemoveDesc => translate('confirmUserRemoveDesc');
  String get removeButton => translate('removeButton');
  String get cancelButton => translate('cancelButton');
  String get meetingEdit => translate('meetingEdit');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
