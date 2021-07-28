# [VM Migration workshop by Google](https://googlecloud.qwiklabs.com/classrooms/10497/labs/95033)

## 1. Set GCE rightsizing parameters and explore dependencies with Stratozone

A. Use StratoZone to get a detailed view of the VMs in the datacenter, what's running on them, and how they are interacting. In addition, configure StratoZone's settings for generating rightsize recommendations for the GCE environment

Stratozone can enable you to :
- Generate VM inventory details and an overview of what is running where

- Set defaults for the GCE machine mappings and TCO estimations

- Use StratoZone's Dependency+ feature to generate an automated view of machine dependencies

B. Use StratoZone to analyze an existing **vSphere environment**

Analyze provides information about the current environment, and it will work with vSphere, AWS, Azure, GCP, bare metal, etc. Plan then allows the user to plan details of an upcoming migration. Migrate, which isn't currently included with the free-to-partners Google-StratoZone deal, has some actual migration features.

**Assessments** would typically be the starting point in a new data collection. From this tab, the user can create, monitor, and manage data collectors (StratoProbes).

Adding a new assessment (+ button next to Manage Assessments) would send a link to an email address of your choice, and the recipient would download and install the StratoProbe in their respective data center. The StratoProbe would be given **network and credential access to the VMs, to the StratoZone mother ship (hosted in GCP), to vCenter, and SSH/WMI access to the VMs.**

C. Use StratoZone's machine mapping features

When StratoZone investigates machines with SSH/WMI, it **uses netstat to analyze how those machine are communicating with machines over the network.** Over time, it builds up a map of inter-machine communication. (Leave it running for 1 week or more to capture all dependencies)

D. Use StratoZone's Dependency detection features to examine apparent machine relationships

As stated, StratoZone detects dependencies by connecting to machines via SSH/WMI, and using netstat to check network communications over time. It filters out noise and builds views of key VM to VM relationships.

**Unscanned devices are IPs** that are interacting with our web server, but they are unscanned by StratoZone. It could be they are outside the organization, or just that they are in a part that isn't currently under scan. We will need to work with the client to fill in some of the blanks on what these machines are. StratoZone offers a feature for naming these machines so that once they are identified, all diagrams will update with the assigned name. Grouping them for now is a good way to consolidate and simplify the view.

(PRIVATE IPS RIGHT?)

Unknown Subnets is a category of unscanned devices known to be outside any scanned subnets.

## 2. Examining datacenter inventory and predicting migration TCO/ROI with CloudPhysics
Explore some of the criteria used by CloudPhysics when calculating TCO, and will compare TCO and ROI estimates based on several different migration options

- Use CloudPhysics to investigate a vSphere environment

- Use the GCP Cloud Simulator to explore the impact of various rightsizing decisions on predicted GCP TCO

- Quickly compare estimated on-prem TCO with GCP TCO

- Generate a PDF report containing the information you've acquired.

The full analysis document includes
- vCenter Summary
- Host Analysis
- Guest OS analysis
- Host License inventory
- On prem IT Cloud simulation
- GCP Cloud simulation
- AWS to GCP migration simulation
- AWS to GCP bill analysis
- AWS bill analysis
- Google Cloud VMware engine siumulator 
- Cost comparison of on pre IT vs Public cloud


## 3. Set up and use the Application doscvery template for Clients

[Migration Discovery/Application Discovery Sample Quesstionnaire for clients](https://forms.gle/iJp3iyvEXZiCuvX38)

## 4. Analyze four applications, check for limitations, estimate complexity of migration, sort migration waves, and pick a first mover
We've used CloudPhysics to generate a TCO report, and we've used StratoZone to find both inventory and dependencies. We've completed a questionnaire that application owners and SMEs might use to provide information related to their workloads, and to add domain knowledge to what tools found. All of these things would become part of the deliverables of the discovery phase of our VM migration. After discovery comes assessment.

Next step is to examine four case studies, checking for limitations, estimating migration complexity, and lastly picking a first mover.

[Case studies](https://docs.google.com/document/d/1JNlo5bscgMEt8DGBXzQms36TjdMGOy6Tl9xZHLaH4jQ/edit?usp=sharing)

[Sample Application Discovery Questionnaire results doc answers](https://drive.google.com/file/d/1HU0GrvSeAQ9Eb0YdGn9XRW3gU4W36HPC/view?usp=sharing)


In the [Migration - Discovery - Data Analysis](https://docs.google.com/document/d/1OLB5BL_n83cmLU29tUEGj9W4a6BvOkfwI8FFtBLBGZ8/edit?usp=sharing&resourcekey=0-TbshcfB_Jfl1-5nBYi4pyg) guide from Google, they offer good advice on several major sources of complexity worth including in your scoring system.


[Sample scoring sheet for picking your first mover App](https://docs.google.com/spreadsheets/d/1E-vAvMiTJewmq1dZYXDBe6wOpvYSi17WWTRHVkulW2Y/edit?usp=sharing)

## 5. Terraforming GCP

As a best practice, Google recommends that the initial GCP foundation is built using a IaC technology like Terraform.

Next, we will learn how to:

- Configure GCP for Terraform use

- Create and execute Terraform scripts to build key GCP foundational elements

A. Terraform a starter GCP environment

Terraform is a popular open-source tool for defining and provisioning GCP infrastructure (Infrastructure as Code). It uses .tf files to describe the configuration and architectural changes needed for a single application or for an entire data center. As the configuration changes, Terraform is able to determine what changed and create incremental execution plans which can be applied.

The infrastructure Terraform can manage includes low-level components such as compute instances, storage, and networking, as well as high-level components such as DNS entries, SaaS features, etc.

This [GCP Cloud Foundation toolkit](https://github.com/terraform-google-modules) on github has scripts that could be useful when Terraforming your GCP environment. Make sure to check them out!
