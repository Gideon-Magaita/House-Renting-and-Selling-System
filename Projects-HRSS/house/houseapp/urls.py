from django.urls import path
from .import views
from .import tenant_view
from .import superuser_view
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.home, name='home'),

    #authentication urls
    path('login_user', views.login_user, name='login_user'),
    path('register',views.register, name='register'),
    path('logoutUser',views.logoutUser, name='logoutUser'),
    #authentication urls

    path('description', views.description, name='description'),
    path('delete_des/<int:id>', views.delete_des, name='delete_des'),
    path('update_description/<int:id>', views.update_description, name='update_description'),

    path('notification',views.notification, name='notification'),
    path('my_feedback/',views.my_feedback, name='my_feedback'),
    path('view_nyumba/<int:id>',views.view_nyumba, name='view_nyumba'),
    # path('feedback_view',views.feedback_view, name='feedback_view'),
    
    #location on map implementation
    path('house_location',tenant_view.house_location, name='house_location'),



    #tenanturls
    path('tenant_home', tenant_view.tenant_home, name='tenant_home'),
    path('houses', tenant_view.houses, name='houses'),
    path('view_house/<int:id>',tenant_view.view_house, name='view_house'),
    path('chatroom',tenant_view.chatroom, name='chatroom'),
    path('ten_feedback/',tenant_view.ten_feedback, name='ten_feedback'),
    path('feed',tenant_view.feed, name='feed'),
    path('payment', tenant_view.payment, name='payment'),
    
    #chat urls
    path('tenant_chat/',tenant_view.tenant_chat, name='tenant_chat'),

    #chat urls house owner
    path('chat/', views.chat, name='chat'),

    #super_user_urls
    path('home_admin/',superuser_view.home_admin, name='home_admin'),
    path('category/',superuser_view.category, name='category'),
    path('user_feedbacks',superuser_view.user_feedbacks, name='user_feedbacks'),
    path('delete_cat/<int:id>',superuser_view.delete_cat, name='delete_cat'),
    path('edit_cat/<int:id>',superuser_view.edit_cat,name='edit_cat'),
    path('house_view',superuser_view.house_view, name='house_view'),
    path('agent',superuser_view.agent, name='agent'),
    path('edit_agent/<int:id>',superuser_view.edit_agent, name='edit_agent'),
   
    
]

urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT) #image configurations