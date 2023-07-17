from django import forms
#authimports
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, Group
from django import forms
#endauthimports
from django.forms import ModelForm
#from matplotlib import widgets
from .models import *


class CreateUserForm(UserCreationForm):

    group = forms.ModelChoiceField(queryset=Group.objects.filter(name__in=['tenant','house owner']),
                                   required=True)

    class Meta:
        model = User
        fields = ['username','email','password1','password2', 'group']



#house form to set house description
class HouseForm(ModelForm):
    class Meta:
        model = House
        fields = ['owner','number','category','location','purpose','price','rooms','image','video','status']

        widgets = {
            'owner':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter house owner'}),
            'number':forms.NumberInput(attrs={'class':'form-control','min':'0','placeholder':'Enter house number'}),
            'category':forms.Select(attrs={'class':'form-control','placeholder':'Choose house category'}),
        
            'location':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter house location'}),

            'purpose':forms.Select(attrs={'class':'form-control','placeholder':'Select purpose'}),
            'status':forms.Select(attrs={'class':'form-control','placeholder':'Select status'}),
            'price':forms.NumberInput(attrs={'class':'form-control','min':'0','placeholder':'Enter house price per month'}),
            'rooms':forms.NumberInput(attrs={'class':'form-control','min':'0','placeholder':'Enter number of rooms per house'}),
            'image':forms.FileInput(attrs={'class':'form-control', 'required':'required'}),
            'video':forms.FileInput(attrs={'class':'form-control', 'required':'required'}),
            
        }
#validate white space
    def clean(self):
        cleaned_data = super().clean()
        owner = cleaned_data.get('owner')
        number = cleaned_data.get('number')
        location = cleaned_data.get('location')

        if owner and owner.strip() == '':
            self.add_error('owner', 'There is something wrong in your inputs!')

        if number and number.strip() == '':
            self.add_error('number', 'There is something wrong in your inputs!')

        if location and location.strip() == '':
            self.add_error('location', 'There is something wrong in your inputs!')




class ChatroomForm(ModelForm): 
    class Meta:
        model = Chatroom  
        fields = ['chattitle']
        

        widgets = {
            'chattitle':forms.Textarea(attrs={'class':'form-control','placeholder':'Type a message....','required':'required'})
                }

 
        
class FeedbackForm(ModelForm):
    class Meta:
        model = Feedback
        fields = ['feedback']

        widgets = {
            'feedback':forms.Textarea(attrs={'class':'form-control','placeholder':'Send feedback....','required':'required'})
        }


class TenantMessageForm(ModelForm):
    #retrieve users from specific group
    owner = forms.ModelChoiceField(queryset=Group.objects.get(name='House Owner').user_set.all(),required=True,widget=forms.Select(attrs={'class': 'form-control'}))

    class Meta:
        model = TenantMessage
        fields = ['owner','content']

        widgets = {
            'content':forms.Textarea(attrs={'class':'form-control','placeholder':'Send message....','required':'required'})
        }


  

class OwnerMessageForm(ModelForm):
     #retrieve users from specific group
     tenant = forms.ModelChoiceField(queryset=Group.objects.get(name='tenant').user_set.all(), required=True,widget=forms.Select(attrs={'class': 'form-control'}))

     class Meta:
        model = OwnerMessage
        fields = ['tenant','content']

        widgets = {
            'content':forms.Textarea(attrs={'class':'form-control','placeholder':'Send message....','required':'required'})
        }



   

class House_locationForm(ModelForm):
    class Meta:
        model = House_location
        fields= ['location_name']

        widgets = {
            'location_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter location name'}),
        }
    

class HouseTypeForm(ModelForm):
    class Meta:
        model = HouseType
        fields=['category']

        widgets={
            'category':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter house category','required':'True',}),
        }

class AgentsForm(ModelForm):
    class Meta:
        model = Agents
        fields=['caption','picture']
        widgets={
            'caption':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter image caption','required':'True',}),
            'picture':forms.FileInput(attrs={'class':'form-control'}),
        }