#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[21]:


df1 = pd.read_csv('file1.csv')
df1


# In[13]:


df1.columns


# In[22]:


df2 = pd.read_csv('file2.csv')
df2


# In[14]:


df2.columns


# In[23]:


df3 = pd.read_csv('file3.csv')
df3


# In[15]:


df3.columns


# In[24]:


lst_to_concat = [df1, df2, df3]
data = pd.concat(lst_to_concat)
data


# In[25]:


column_names = data.columns

list(column_names)


# In[26]:


cols = []

for col in column_names:
    cols.append(col.lower().replace(' ', ''))
    
cols


# In[27]:


data


# In[28]:


cols = [col.lower() for col in data.columns] 
cols


# In[29]:


data.columns = cols
data


# In[32]:


data.dtypes


# In[33]:


data.select_dtypes(np.number)


# In[34]:


data = data.drop(['education'], axis=1)
data


# In[35]:


data = data.drop_duplicates()
data


# In[ ]:


condition = data['income']!='0'
condition1 = (data['income']!='0') | (data['state']=='CA')
condition2 = (data['income']!='0') & (data['state']=='CA')

data[condition2]

