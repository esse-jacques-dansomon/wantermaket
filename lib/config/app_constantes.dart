
class AppConstants {
  static const String APP_NAME = 'WANTERMARKET';
  // static const String BASE_URL = 'https://wantermarket.sn';
  static const String BASE_URL = 'http://10.0.2.2:8000/api';
  // static const String BASE_URL = 'https://squid-app-ldgyy.ondigitalocean.app/api';
  static const String BASE_URL_IMAGE = 'https://wantermarket.sn/';
  static const String SLIDER_URI= '/sliders';
  static const String CATEGORIES_URI = '/categories';
  static const String CATEGORIES_URI_PRODUCTS = '/categorie';
  static const String SOUS_CATEGORIES_URI = '/souscategories';
  static const String PRODUITS_URI = '/produits';
  static const String BOUTIQUE_URI = '/boutiques';
  static const String BOUTIQUE_update_URI = '/boutique';
  static const String VENDEUR_URI = '/vendeurs';
  static const String VENDEUR_BOUTIQUES_FAVORIS = '/vendeurs/favories';
  static const String BOUTIQUES_FAVORIS = '/boutiques/favories';
  static const String TOP_PRODUITS_URI = '/produits/classe/2';
  static const String DEAL_PRODUITS_URI = '/produits/classe/3';
  static const String NOUVEAUX_PRODUITS_URI = '/produits/classe/1';
  static const String TOP_CATEGORIES_URI = '/categorie/top';
  static const String BOUTIQUES_EXCLUSIVES = '/boutique/exclusive';
  static const String PLANS_URI = '/plans';

  //AUTH
  static const String SEARCH_URI = '/search';
  static const String LOGIN_URI = '/login';
  static const String RESET_PASSWORD_URI = '/password/update';
  static const String PASSWORD_FORGOT_URI = '/password/forget';
  static const String PASSWORD_OTP_URI = '/password/otp/verif';
  static const String LOGOUT = '/logout';
  static const String USER_CONNECTED_INFO = '/verify';
  static const String TOKEN_URI = '/store/usertoken';
  //SELLER
  static const String VENDOR_BOUTIQUE_URI = '/vendeur';
  static const String VENDOR_STATS_URI= '/boutique/stats';
  static const String VENDOR_PRODUCTS_URI = '/boutique/produits';

  //PAYMENT LINK
  static const String PAY_BECOME_EXCLUSIVE_URI = '/exclusive';
  static const String PAY_ABONNEMENT_URI = '/abonnement';
  static const String PAY_ETAT_URI = '/paiement/verif';

  // sharePreference
  static const String TOKEN = 'token';
  static const String VENDOR_ID = 'vendor_id';
  static const String BOUTIQUE_ID = 'BOUTIQUE_ID';
  static const String BOUTIQUE_NAME = 'boutique_name';
  static const String USER_CREDENTIALS = 'user_id';
  static const String ADRESSE = 'adresse';
  static const String WISHLIST = 'wishlist';


  static const String ETAT_ABONNEMENT = 'etat_abonnement';
  static const String CAN_ADD_PRODUCT = 'can_add_product';
  static const String TYPE_PLAN = 'type_plan';
  static const String PROFILE_IMAGE = 'profile_image';

}
