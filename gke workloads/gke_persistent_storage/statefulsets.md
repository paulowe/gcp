## Each pod in a statefulset maintains a persistent identity
- Ordinal index
- Stable hostname
- Stable identified storage linked to the Ordinal index

Ordinal Index is simply a Unique sequential number. It defines Pod replica position in the StatefulSet

## Characteristics of StatefulSets

![image](https://user-images.githubusercontent.com/40435982/144963696-0ec45367-05d3-44d7-a875-6d19aed9ac74.png)

## 1. OrderedReady (default).  
![image](https://user-images.githubusercontent.com/40435982/144962431-5f536fdb-bde8-440f-8fc6-a63aca19171e.png)

Override sequential behavior set pod management policy to Parallel

## 2.  StatefulSets require a service to control their networking
![image](https://user-images.githubusercontent.com/40435982/144962746-9c42406e-7c03-4df1-a651-c17e27acfb2e.png)

## 3. PVCs can use ReadWriteOnce for StatefulSets
![image](https://user-images.githubusercontent.com/40435982/144962862-23c52107-070b-4cea-92d1-9b5ab4753684.png)

## 4. Define container details
![image](https://user-images.githubusercontent.com/40435982/144962972-9a64d167-b69a-4049-b46f-cb4123e6ab44.png)

## 5. Specify Volume claim templates. 
![image](https://user-images.githubusercontent.com/40435982/144962715-b471c123-f60c-4363-8dcf-a7fd5c096caa.png)

## How can I make a headless Service to bring together the Pods in a StatefulSet?
By specifying None for the cluster IP in the Service definition

## How are the Pods that make up a StatefulSet distinguished from one another?
By an ordinal index at the end of their names
