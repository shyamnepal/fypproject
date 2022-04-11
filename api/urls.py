
from unicodedata import name
from django.urls import path
from .import views

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,

)
from api.views import  RegisterAPIView

urlpatterns = [
    path('person-details/', views.showall, name='person-details'),
    path('register/', views.register, name='register'),
    path('registerupdate/<int:pk>/', views.registerUpdate, name='registerupdate'),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('userregister/', views.RegisterAPIView.as_view()),
    path('login/',TokenObtainPairView.as_view(),name='login_view'),
    path('userlogin/', views.LoginView.as_view(),name="userlogin"),
     path('adminlogin/', views.adminLogin.as_view(),name="userlogin"),
    #path('logout/', views.LogOutAPIView.as_view(), name='logout_view'),
   # path('userlogout/', views.User_logout, name='userlogout_view'),
   # path('profile/',views.profiles.as_view()),
     path('hotel-details/', views.HotelsInfo.as_view()),
     path('room-details/', views.HotelsRoomInfo.as_view()),
     path('hotel-update/<int:pk>/', views.updatehotelInfo, name='updateHotel'),
     path('hotel-delete/<int:pk>/', views.deleateHotelInfo, name='deleteHotel'),
     path('room-update/<int:pk>/', views.updateroomInfo, name='updateroom'),
     path('room-delete/<int:pk>/', views.deleateRoomInfo, name='deleteroom'),
     
   
    path('hotel-data/<int:pk>/', views.shwoonedata, name='hotel-data'),
    path('room-datashow/<int:pk>/', views.shwoRoomonedata, name='deleteroom'),
    # path('password-rest/<uidb64>/token/',views.PasswordTokenCheckAPI.as_view, name='xx'),
    # path('request-reset-email/',views.RequestPasswordResetEmail.as_view,name="password-rest")

    path('customer-details/', views.CustomerDetails.as_view()),
    path('customerDetails-delete/<int:pk>/', views.customerDelete, name='deletecustomerdetails'),
    path('customerDetails-update/<int:pk>/', views.updateCustomerDetails, name='customerDetailsupdate'),
    path('filterHotel/', views.filterRoomList.as_view(), name='customerDetailsupdate'),
    path('customer-info/', views.CustomerInfo.as_view()),
    # path('getuser/', views.getuserid.as_view()),

]