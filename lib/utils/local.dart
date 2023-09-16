import 'package:get/get.dart';

class AppTranslations implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          // TODO Language & Country
          'egypt': 'مصر',
          'palestine': 'فلسطين',
          'saudi_arabia': 'السعودية',
          'uae': 'الإمارات',
          'kuwait': 'الكويت',
          'select_your_country': 'إختر بلدك',
          'select_your_language': 'اختر لغتك',
          'next': 'التالي',
          'save': 'حفظ',
          'skip': 'تخطي',

          // TODO Boardings
          'title1': '"تبدأ أفضل لحظات الجمال معنا. احجز موعدك الآن!"',
          'title2':
              '"تخصصنا هو إبراز جمالك الحقيقي ، احجز موعدًا معنا ، واستمتع بتجربة فريدة من نوعها."',
          'title3':
              '"استعد لجمال لا يضاهى! اطلب منتجات التجميل من خلال تطبيقنا واحصل على تسوق ممتع ومريح"',

          // TODO Auth
          'signin': 'تسجيل الدخول',
          'sign_in': 'تسجيل الدخول',
          'sign_up': 'تسجيل حساب',
          'phone': 'رقم الهاتف',
          'password': 'كلمة المرور',
          'forget_password!': 'نسيت كلمة المرور!',
          'or': 'أو',
          'full_name': 'الإسم كاملاً',
          'username': 'إسم المستخدم',
          'email': 'البريد الإلكتروني',
          'confirm_password': 'تأكيد كلمة المرور',
          'create_account': 'إنشاء حساب',

          // TODO VALIDATION Sign IN
          'please_enter_phone_number': 'يرجى إدخال رقم الهاتف الخاص بك',
          'please_enter_password': 'الرجاء إدخال كلمة المرور',
          'password_must_be_more_than_6':
              'كلمة المرور يجب أن تكون أكثر من ستة أحرف',
          'please_enter_your_name': 'من فضلك ادخل اسمك الكامل',
          'please_enter_username': 'الرجاء إدخال اسم المستخدم',
          'please_enter_email': 'رجاءا أدخل بريدك الإلكتروني',
          'please_enter_email_valid': 'يرجى إدخال بريد الكتروني صحيح',
          'please_enter_confirm_password': 'الرجاء إدخال تأكيد كلمة المرور',
          'tow_password_not_match': 'كلمتا المرور غير متطابقتان',

          // TODO Forget Password
          'forget_password': 'نسيت كلمة المرور',
          'select_which_contact_details':
              'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
          'via_email': 'عبر البريد الالكتروني',
          'via_phone': 'عبر رقم الهاتف',
          'send': 'إرسال',
          'enter_email_to_reset_password':
              'الرجاء إدخال البريد الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك',
          'enter_phone_to_reset_password':
              'الرجاء إدخال رقم الهاتف لإعادة تعيين كلمة المرور الخاصة بك',
          'back_signin': 'العودة إلى صفحة تسجيل الدخول',
          'code_verification': 'التحقق من الرمز',
          'sent_code_to_email': 'لقد أرسلنا رمز التحقق إلى بريدك الإلكتروني.',
          'sent_code_to_phone': 'لقد أرسلنا رمز التحقق إلى رقم هاتفك المحمول :',
          'send_again': 'أعد الإرسال',
          'create_new_password': 'إنشاء كلمة مرور جديدة',
          'create_secure_password': 'قم بإنشاء كلمة مرور قوية وآمنة تحمي حسابك',
          'confirm': 'Confirm',
          'congratulations': 'تهانينا!',
          'account_ready_use': 'حسابك جاهز للاستخدام,',
          'signin_enjoy_features': 'قم بتسجيل الدخول مرة أخرى واستمتع بميزاتنا',

          // TODO HOME
          'home': 'الرئيسية',
          'favorite': 'المفضلة',
          'my_orders': 'طلباتي',
          'messages': 'الرسائل',
          'my_profile': 'الملف الشخصي',
          'profile': 'الملف الشخصي',
          'search': 'البحث',
          'services': 'الخدمات',
          'top_five': 'الخمسة الأوائل',
          'recent_visited': 'تمت زيارته مؤخرًا',
          'see_all': 'عرض الكل',
          // TODO FAVORITE
          'top_favorite': 'أعلى المفضلة',
          'dont_have_favourite': 'آسف ليس لديك أي مفضلة الآن!',
          'your_favourite': 'المفضلة لديك',
          // TODO ORDERS
          'stores': 'المتاجر',
          'halls': 'القاعات',
          'dresss': 'تأجير الفساتين',
          'beuty_centers': 'مراكز التجميل',
          'photo_sessions': 'جلسات التصوير',

          // TODO PROFILE
          'edit_profile': 'تعديل الملف الشخصي',
          'general': 'عام',
          'settings': 'الإعدادات',
          'help_center': 'مركز المساعدة',

          'personal_information': 'معلومات شخصية',
          'address': 'العنوان',
          'favourites': 'المفضلة',
          'e-wallet': 'المحفظة الإلكترونية',
          'payment_methods': 'طرق الدفع',
          'notifications': 'الإشعارات',
          'languages': 'اللغة',
          'faq': 'التعليمات',
          'contact_us': 'اتصل بنا',
          'privacy_policy': 'سياسة الخصوصية',
          'logout': 'تسجيل الخروج',
          'delete_account': 'حذف الحساب',

          //TODO PERSONAL INFORMATION
          'user_name': 'اسم المستخدم',

          //TODO ASSDESS PAGE
          'add_new_address': 'اضافة عنوان جديد',
          'no_address_yet': 'لا يوجد عناوين',
          'add_location': 'أضف عنوانك فقط لتحسين تجربتك',
          'governorate': 'المحافظة',
          'region': 'المنطقة',
          'street': 'الشارع',
          'house_number': 'رقم البيت',

          //TODO NOTIFICATION PAGE
          'notification': 'اشعارات',
          'no_notification_yet': 'لا يوجد اشعارات',
          'notification_alert': 'عند تلقيك اشعارات سوف تظهر هنا ',
        },
        "en": {
          // TODO Language & Country
          'egypt': 'Egypt',
          'palestine': 'Palestine',
          'saudi_arabia': 'Saudi Arabia',
          'uae': 'The UAE',
          'kuwait': 'Kuwait',
          'select_your_country': 'Select your Country',
          'select_your_language': 'Select your language',
          'next': 'Next',
          'save': 'Save',
          'skip': 'Skip',

          // TODO Boardings
          'title1':
              '"The best beauty moments start with us. Book your appointment now!"',
          'title2':
              '"Our specialty is to bring out your true beauty.Book an appointment with usEnjoy a unique experience."',
          'title3':
              '"Get ready for incomparable beauty! Order beauty products through our app And get a pleasant and comfortable shopping"',

          // TODO Auth
          'signin': 'Sign In',
          'sign_in': 'SIGN IN',
          'sign_up': 'SIGN UP',
          'phone': 'Phone',
          'password': 'Password',
          'forget_password!': 'Forget Password!',
          'or': 'OR',
          'full_name': 'Full Name',
          'username': 'Username',
          'email': 'Email',
          'confirm_password': 'Confirm Password',
          'create_account': 'Create Account',

          // TODO VALIDATION Sign IN
          'please_enter_phone_number': 'Please enter your phone number',
          'please_enter_password': 'Please enter the password',
          'password_must_be_more_than_6':
              'Password must be more than six characters',
          'please_enter_your_name': 'Please enter your full name',
          'please_enter_username': 'Please enter username',
          'please_enter_email': 'Please enter your email',
          'please_enter_email_valid': 'Please enter a valid email',
          'please_enter_confirm_password': 'Please enter confirm password',
          'tow_password_not_match': 'The two passwords do not match',

          // TODO Forget Password
          'forget_password': 'Forget Password',
          'select_which_contact_details':
              'Select which contact details should we use to reset your password',
          'via_email': 'Via Email',
          'via_phone': 'Via Phone number',
          'send': 'Send',
          'enter_email_to_reset_password':
              'Please enter the email to reset your password',
          'enter_phone_to_reset_password':
              'Please enter the phone number to reset your password',
          'back_signin': 'Back to Sign in page',
          'code_verification': 'Code Verification',
          'sent_code_to_email': 'We sent the code verification to your email :',
          'sent_code_to_phone':
              'We sent the code verification to your mobile number :',
          'send_again': 'send again',
          'create_new_password': 'Create New password',
          'create_secure_password':
              'Create a strong and secure password that protects your account',
          'confirm': 'Confirm',
          'congratulations': 'Congratulations!',
          'account_ready_use': 'Your account is ready to use,',
          'signin_enjoy_features': 'Sign in again and enjoy our features',

          // TODO HOME
          'home': 'Home',
          'favorite': 'Favorite',
          'my_orders': 'My Orders',
          'messages': 'Messages',
          'my_profile': 'My Profile',
          'profile': 'Profile',
          'search': 'Search',
          'services': 'Services',
          'top_five': 'Top five',
          'recent_visited': 'Recent Visited',
          'see_all': 'See all',

          // TODO FAVORITE
          'top_favorite': 'Top Favourite',
          'dont_have_favourite': 'Sorry you don’t have any favourite now!',
          'your_favourite': 'Your Favourite',

          // TODO ORDERS
          'stores': 'Store’s',
          'halls': 'Hall’s',
          'dresss': 'Dress’s',
          'beuty_centers': 'Beuty Center’s',
          'photo_sessions': 'Photo Session’s',

          // TODO PROFILE
          'edit_profile': 'Edit profile',
          'general': 'General',
          'settings': 'Settings',
          'help_center': 'Help center',

          'personal_information': 'Personal Information',
          'address': 'Address',
          'favourites': 'Favourites',
          'e-wallet': 'E-Wallet',
          'payment_methods': 'Payment Methods',
          'notifications': 'Notifications',
          'languages': 'Language',
          'faq': 'FAQ',
          'contact_us': 'Contact us',
          'privacy_policy': 'Privacy Policy',
          'logout': 'Logout',
          'delete_account': 'Delete Account',

          //TODO PERSONAL INFORMATION
          'user_name': 'User Name',

          //TODO ADDRESS PAGE
          'add_new_address': 'Add New Address',
          'no_address_yet': 'No Address Yet',
          'add_location':
              'Add your location only to provide a better experince',
          'governorate': 'Governorate',
          'region': 'Region',
          'street': 'Street',
          'house_number': 'House Number',

          //TODO NOTIFICATION PAGE
          'notification': 'Notification',
          'no_notification_yet': 'No Notification Yet',
          'notification_alert':
              'When you get notifications, it will show up here',
        }
      };
}
