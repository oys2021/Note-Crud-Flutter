from django.urls import path
from . import views

urlpatterns = [
    path('getnote', views.getnote, name='getnote'),
    path('notes/create', views.create_note, name='create_note'),
    path('note/<int:pk>', views.note, name='note'),
    path('update_note/<int:pk>', views.update_note, name='update_note'),
    path('delete_note/<int:pk>', views.delete_note, name='delete_note'),
]
