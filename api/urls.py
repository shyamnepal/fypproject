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
    path('logout/', views.LogOutAPIView.as_view(), name='logout_view'),
    path('userlogout/', views.User_logout, name='userlogout_view'),
    path('profile/',views.profiles.as_view()),
    path('hotel-details/', views.HotelsInfo.as_view()),
    path('room-details/', views.HotelsRoomInfo.as_view()),

]