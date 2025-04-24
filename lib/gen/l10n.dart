// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(
      _current != null,
      'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Account & Security`
  String get account_security {
    return Intl.message(
      'Account & Security',
      name: 'account_security',
      desc: '',
      args: [],
    );
  }

  /// `added`
  String get added {
    return Intl.message('added', name: 'added', desc: '', args: []);
  }

  /// `Add item`
  String get add_item {
    return Intl.message('Add item', name: 'add_item', desc: '', args: []);
  }

  /// `Add New Business`
  String get add_new_business {
    return Intl.message(
      'Add New Business',
      name: 'add_new_business',
      desc: '',
      args: [],
    );
  }

  /// `Add New Item`
  String get add_new_item {
    return Intl.message(
      'Add New Item',
      name: 'add_new_item',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `all`
  String get all {
    return Intl.message('all', name: 'all', desc: '', args: []);
  }

  /// `Already have a account?  `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have a account?  ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `API Access`
  String get api_access {
    return Intl.message('API Access', name: 'api_access', desc: '', args: []);
  }

  /// `Bita`
  String get appTitle {
    return Intl.message('Bita', name: 'appTitle', desc: '', args: []);
  }

  /// `App Version`
  String get app_version {
    return Intl.message('App Version', name: 'app_version', desc: '', args: []);
  }

  /// `Auto-Save Changes`
  String get auto_save_changes {
    return Intl.message(
      'Auto-Save Changes',
      name: 'auto_save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Backup & Restore`
  String get backup_restore {
    return Intl.message(
      'Backup & Restore',
      name: 'backup_restore',
      desc: '',
      args: [],
    );
  }

  /// `Barcode Scanner`
  String get barcode_scanner {
    return Intl.message(
      'Barcode Scanner',
      name: 'barcode_scanner',
      desc: '',
      args: [],
    );
  }

  /// `Batch Editing`
  String get batch_editing {
    return Intl.message(
      'Batch Editing',
      name: 'batch_editing',
      desc: '',
      args: [],
    );
  }

  /// `Batch Number`
  String get batch_number {
    return Intl.message(
      'Batch Number',
      name: 'batch_number',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message('Brand', name: 'brand', desc: '', args: []);
  }

  /// `businesses available`
  String get businesses_available {
    return Intl.message(
      'businesses available',
      name: 'businesses_available',
      desc: '',
      args: [],
    );
  }

  /// `Business Name`
  String get business_name {
    return Intl.message(
      'Business Name',
      name: 'business_name',
      desc: '',
      args: [],
    );
  }

  /// `Business Profiles`
  String get business_profiles {
    return Intl.message(
      'Business Profiles',
      name: 'business_profiles',
      desc: '',
      args: [],
    );
  }

  /// `Business Type`
  String get business_type {
    return Intl.message(
      'Business Type',
      name: 'business_type',
      desc: '',
      args: [],
    );
  }

  /// `By Name`
  String get by_name {
    return Intl.message('By Name', name: 'by_name', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get check {
    return Intl.message('Check', name: 'check', desc: '', args: []);
  }

  /// `Check out`
  String get check_out {
    return Intl.message('Check out', name: 'check_out', desc: '', args: []);
  }

  /// `Cloud Sync`
  String get cloud_sync {
    return Intl.message('Cloud Sync', name: 'cloud_sync', desc: '', args: []);
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Suppliers`
  String get connect_with_suppliers {
    return Intl.message(
      'Connect with Suppliers',
      name: 'connect_with_suppliers',
      desc: '',
      args: [],
    );
  }

  /// `Contact Number`
  String get contact_number {
    return Intl.message(
      'Contact Number',
      name: 'contact_number',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contact_support {
    return Intl.message(
      'Contact Support',
      name: 'contact_support',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Create a new business profile`
  String get create_a_new_business_profile {
    return Intl.message(
      'Create a new business profile',
      name: 'create_a_new_business_profile',
      desc: '',
      args: [],
    );
  }

  /// `CSV, Excel, or PDF`
  String get csv_excel_or_pdf {
    return Intl.message(
      'CSV, Excel, or PDF',
      name: 'csv_excel_or_pdf',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message('Currency', name: 'currency', desc: '', args: []);
  }

  /// `Current Business`
  String get current_business {
    return Intl.message(
      'Current Business',
      name: 'current_business',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Date Format`
  String get date_format {
    return Intl.message('Date Format', name: 'date_format', desc: '', args: []);
  }

  /// `Date Received`
  String get date_received {
    return Intl.message(
      'Date Received',
      name: 'date_received',
      desc: '',
      args: [],
    );
  }

  /// `DD/MM/YYYY`
  String get dd_mm_yyyy {
    return Intl.message('DD/MM/YYYY', name: 'dd_mm_yyyy', desc: '', args: []);
  }

  /// `Default Sort Order`
  String get default_sort_order {
    return Intl.message(
      'Default Sort Order',
      name: 'default_sort_order',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get disabled {
    return Intl.message('Disabled', name: 'disabled', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Edit Business Profile`
  String get edit_business_profile {
    return Intl.message(
      'Edit Business Profile',
      name: 'edit_business_profile',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Email, Live Chat, or Phone`
  String get email_live_chat_or_phone {
    return Intl.message(
      'Email, Live Chat, or Phone',
      name: 'email_live_chat_or_phone',
      desc: '',
      args: [],
    );
  }

  /// `Enabled`
  String get enabled {
    return Intl.message('Enabled', name: 'enabled', desc: '', args: []);
  }

  /// `Enter your email address`
  String get enterYourEmailAddress {
    return Intl.message(
      'Enter your email address',
      name: 'enterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// ` ETB`
  String get etb {
    return Intl.message(' ETB', name: 'etb', desc: '', args: []);
  }

  /// `ETB `
  String get etb_ {
    return Intl.message('ETB ', name: 'etb_', desc: '', args: []);
  }

  /// `ETB (Ethiopian Birr)`
  String get etb_ethiopian_birr_ {
    return Intl.message(
      'ETB (Ethiopian Birr)',
      name: 'etb_ethiopian_birr_',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiry_date {
    return Intl.message('Expiry Date', name: 'expiry_date', desc: '', args: []);
  }

  /// `Explore Products`
  String get explore_products {
    return Intl.message(
      'Explore Products',
      name: 'explore_products',
      desc: '',
      args: [],
    );
  }

  /// `Export Data`
  String get export_data {
    return Intl.message('Export Data', name: 'export_data', desc: '', args: []);
  }

  /// `FAQs & Tutorials`
  String get faqs_tutorials {
    return Intl.message(
      'FAQs & Tutorials',
      name: 'faqs_tutorials',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Finances`
  String get finances {
    return Intl.message('Finances', name: 'finances', desc: '', args: []);
  }

  /// `Forget password`
  String get forget_password {
    return Intl.message(
      'Forget password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Fri`
  String get fri {
    return Intl.message('Fri', name: 'fri', desc: '', args: []);
  }

  /// `General Settings`
  String get general_settings {
    return Intl.message(
      'General Settings',
      name: 'general_settings',
      desc: '',
      args: [],
    );
  }

  /// `Gifts Cards`
  String get gifts_cards {
    return Intl.message('Gifts Cards', name: 'gifts_cards', desc: '', args: []);
  }

  /// `Go back`
  String get go_back {
    return Intl.message('Go back', name: 'go_back', desc: '', args: []);
  }

  /// `Help Center`
  String get help_center {
    return Intl.message('Help Center', name: 'help_center', desc: '', args: []);
  }

  /// `Image URL`
  String get image_url {
    return Intl.message('Image URL', name: 'image_url', desc: '', args: []);
  }

  /// `Integrations & Export`
  String get integrations_export {
    return Intl.message(
      'Integrations & Export',
      name: 'integrations_export',
      desc: '',
      args: [],
    );
  }

  /// `Inventory`
  String get inventory {
    return Intl.message('Inventory', name: 'inventory', desc: '', args: []);
  }

  /// `Inventory Management`
  String get inventory_management {
    return Intl.message(
      'Inventory Management',
      name: 'inventory_management',
      desc: '',
      args: [],
    );
  }

  /// `Items Expiring`
  String get items_expiring {
    return Intl.message(
      'Items Expiring',
      name: 'items_expiring',
      desc: '',
      args: [],
    );
  }

  /// `Item X`
  String get item_x {
    return Intl.message('Item X', name: 'item_x', desc: '', args: []);
  }

  /// `Last backup: Never`
  String get last_backup_never {
    return Intl.message(
      'Last backup: Never',
      name: 'last_backup_never',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Log In`
  String get login {
    return Intl.message('Log In', name: 'login', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Low Stock Items`
  String get low_stock_items {
    return Intl.message(
      'Low Stock Items',
      name: 'low_stock_items',
      desc: '',
      args: [],
    );
  }

  /// `Low Stock Threshold`
  String get low_stock_threshold {
    return Intl.message(
      'Low Stock Threshold',
      name: 'low_stock_threshold',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get mon {
    return Intl.message('Mon', name: 'mon', desc: '', args: []);
  }

  /// `My Pharmacy Store`
  String get my_pharmacy_store {
    return Intl.message(
      'My Pharmacy Store',
      name: 'my_pharmacy_store',
      desc: '',
      args: [],
    );
  }

  /// `New Order`
  String get new_order {
    return Intl.message('New Order', name: 'new_order', desc: '', args: []);
  }

  /// `No orders found`
  String get no_orders_found {
    return Intl.message(
      'No orders found',
      name: 'no_orders_found',
      desc: '',
      args: [],
    );
  }

  /// `Not connected`
  String get not_connected {
    return Intl.message(
      'Not connected',
      name: 'not_connected',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `OTP verification failed`
  String get otp_verification_failed {
    return Intl.message(
      'OTP verification failed',
      name: 'otp_verification_failed',
      desc: '',
      args: [],
    );
  }

  /// `out`
  String get out {
    return Intl.message('out', name: 'out', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Password has been reset successfully`
  String get password_has_been_reset_successfully {
    return Intl.message(
      'Password has been reset successfully',
      name: 'password_has_been_reset_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get password_must_be_at_least_8_characters_long {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'password_must_be_at_least_8_characters_long',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long.`
  String get password_must_be_at_least_8_characters_long_ {
    return Intl.message(
      'Password must be at least 8 characters long.',
      name: 'password_must_be_at_least_8_characters_long_',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get payment_methods {
    return Intl.message(
      'Payment Methods',
      name: 'payment_methods',
      desc: '',
      args: [],
    );
  }

  /// ` per unit`
  String get per_unit {
    return Intl.message(' per unit', name: 'per_unit', desc: '', args: []);
  }

  /// `phone`
  String get phone {
    return Intl.message('phone', name: 'phone', desc: '', args: []);
  }

  /// `Phone`
  String get phoneNumber {
    return Intl.message('Phone', name: 'phoneNumber', desc: '', args: []);
  }

  /// `Please enter your credentials`
  String get pleaseEnterYourCredentials {
    return Intl.message(
      'Please enter your credentials',
      name: 'pleaseEnterYourCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your username to reset your password`
  String get please_enter_your_username_to_reset_your_password {
    return Intl.message(
      'Please enter your username to reset your password',
      name: 'please_enter_your_username_to_reset_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Please use the new password when logging in`
  String get please_use_the_new_password_when_logging_in {
    return Intl.message(
      'Please use the new password when logging in',
      name: 'please_use_the_new_password_when_logging_in',
      desc: '',
      args: [],
    );
  }

  /// `POS Integration`
  String get pos_integration {
    return Intl.message(
      'POS Integration',
      name: 'pos_integration',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy & Terms`
  String get privacy_policy_terms {
    return Intl.message(
      'Privacy Policy & Terms',
      name: 'privacy_policy_terms',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get product {
    return Intl.message('Product', name: 'product', desc: '', args: []);
  }

  /// `Product Code`
  String get product_code {
    return Intl.message(
      'Product Code',
      name: 'product_code',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get product_description {
    return Intl.message(
      'Product Description',
      name: 'product_description',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Products List`
  String get products_list {
    return Intl.message(
      'Products List',
      name: 'products_list',
      desc: '',
      args: [],
    );
  }

  /// `Purchase Orders`
  String get purchase_orders {
    return Intl.message(
      'Purchase Orders',
      name: 'purchase_orders',
      desc: '',
      args: [],
    );
  }

  /// `Purchase Price`
  String get purchase_price {
    return Intl.message(
      'Purchase Price',
      name: 'purchase_price',
      desc: '',
      args: [],
    );
  }

  /// `Reports and Analytics`
  String get reports_and_analytics {
    return Intl.message(
      'Reports and Analytics',
      name: 'reports_and_analytics',
      desc: '',
      args: [],
    );
  }

  /// `Re-send Code in`
  String get re_send_a_code_in {
    return Intl.message(
      'Re-send Code in',
      name: 're_send_a_code_in',
      desc: '',
      args: [],
    );
  }

  /// `Re-send Code in `
  String get re_send_code_in_ {
    return Intl.message(
      'Re-send Code in ',
      name: 're_send_code_in_',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Revenue`
  String get revenue {
    return Intl.message('Revenue', name: 'revenue', desc: '', args: []);
  }

  /// `Sale Distribution`
  String get sale_distribution {
    return Intl.message(
      'Sale Distribution',
      name: 'sale_distribution',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get sales {
    return Intl.message('Sales', name: 'sales', desc: '', args: []);
  }

  /// `Sales logged`
  String get sales_logged {
    return Intl.message(
      'Sales logged',
      name: 'sales_logged',
      desc: '',
      args: [],
    );
  }

  /// `Sales Orders`
  String get sales_orders {
    return Intl.message(
      'Sales Orders',
      name: 'sales_orders',
      desc: '',
      args: [],
    );
  }

  /// `Sat`
  String get sat {
    return Intl.message('Sat', name: 'sat', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR code`
  String get scan_qr_code {
    return Intl.message(
      'Scan QR code',
      name: 'scan_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Select Date Range`
  String get select_date_range {
    return Intl.message(
      'Select Date Range',
      name: 'select_date_range',
      desc: '',
      args: [],
    );
  }

  /// `Select Theme`
  String get select_theme {
    return Intl.message(
      'Select Theme',
      name: 'select_theme',
      desc: '',
      args: [],
    );
  }

  /// `Selling Price`
  String get selling_price {
    return Intl.message(
      'Selling Price',
      name: 'selling_price',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Sign out of your account`
  String get sign_out_of_your_account {
    return Intl.message(
      'Sign out of your account',
      name: 'sign_out_of_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Please enter the details below to continue.`
  String get signupDescription {
    return Intl.message(
      'Please enter the details below to continue.',
      name: 'signupDescription',
      desc: '',
      args: [],
    );
  }

  /// `Let's Sign you up`
  String get signupTitle {
    return Intl.message(
      'Let\'s Sign you up',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Stock in Hand`
  String get stock_in_hand {
    return Intl.message(
      'Stock in Hand',
      name: 'stock_in_hand',
      desc: '',
      args: [],
    );
  }

  /// `Stock Quantity`
  String get stock_quantity {
    return Intl.message(
      'Stock Quantity',
      name: 'stock_quantity',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get stores {
    return Intl.message('Stores', name: 'stores', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Subtitle`
  String get subtitle {
    return Intl.message('Subtitle', name: 'subtitle', desc: '', args: []);
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Sun`
  String get sun {
    return Intl.message('Sun', name: 'sun', desc: '', args: []);
  }

  /// `Supplier`
  String get supplier {
    return Intl.message('Supplier', name: 'supplier', desc: '', args: []);
  }

  /// `Support & About`
  String get support_about {
    return Intl.message(
      'Support & About',
      name: 'support_about',
      desc: '',
      args: [],
    );
  }

  /// `Switch Business`
  String get switch_business {
    return Intl.message(
      'Switch Business',
      name: 'switch_business',
      desc: '',
      args: [],
    );
  }

  /// `System Default`
  String get system_default {
    return Intl.message(
      'System Default',
      name: 'system_default',
      desc: '',
      args: [],
    );
  }

  /// `This Month`
  String get this_month {
    return Intl.message('This Month', name: 'this_month', desc: '', args: []);
  }

  /// `This Week`
  String get this_week {
    return Intl.message('This Week', name: 'this_week', desc: '', args: []);
  }

  /// `This Year`
  String get this_year {
    return Intl.message('This Year', name: 'this_year', desc: '', args: []);
  }

  /// `Thu`
  String get thu {
    return Intl.message('Thu', name: 'thu', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Today's Best Seller`
  String get today_s_best_seller {
    return Intl.message(
      'Today\'s Best Seller',
      name: 'today_s_best_seller',
      desc: '',
      args: [],
    );
  }

  /// `Total Orders`
  String get total_orders {
    return Intl.message(
      'Total Orders',
      name: 'total_orders',
      desc: '',
      args: [],
    );
  }

  /// `Total Products`
  String get total_products {
    return Intl.message(
      'Total Products',
      name: 'total_products',
      desc: '',
      args: [],
    );
  }

  /// `Total Value`
  String get total_value {
    return Intl.message('Total Value', name: 'total_value', desc: '', args: []);
  }

  /// `Tue`
  String get tue {
    return Intl.message('Tue', name: 'tue', desc: '', args: []);
  }

  /// `Two-Factor Authentication`
  String get two_factor_authentication {
    return Intl.message(
      'Two-Factor Authentication',
      name: 'two_factor_authentication',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message('Unit', name: 'unit', desc: '', args: []);
  }

  /// `Update your login credentials`
  String get update_your_login_credentials {
    return Intl.message(
      'Update your login credentials',
      name: 'update_your_login_credentials',
      desc: '',
      args: [],
    );
  }

  /// `User Preferences`
  String get user_preferences {
    return Intl.message(
      'User Preferences',
      name: 'user_preferences',
      desc: '',
      args: [],
    );
  }

  /// `User Profile`
  String get user_profile {
    return Intl.message(
      'User Profile',
      name: 'user_profile',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `View and edit your profile`
  String get view_and_edit_your_profile {
    return Intl.message(
      'View and edit your profile',
      name: 'view_and_edit_your_profile',
      desc: '',
      args: [],
    );
  }

  /// `View legal documents`
  String get view_legal_documents {
    return Intl.message(
      'View legal documents',
      name: 'view_legal_documents',
      desc: '',
      args: [],
    );
  }

  /// `View More`
  String get view_more {
    return Intl.message('View More', name: 'view_more', desc: '', args: []);
  }

  /// `Wed`
  String get wed {
    return Intl.message('Wed', name: 'wed', desc: '', args: []);
  }

  /// `Welcome Back!`
  String get welcomeMessage {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `we've send you the verification code on `
  String get we_send_a_code_to {
    return Intl.message(
      'we\'ve send you the verification code on ',
      name: 'we_send_a_code_to',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'am'),
      Locale.fromSubtags(languageCode: 'om'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
