# Playground-k8s-multi-tenancy

Playground for Kubernetes different multi-tenancy options

## Discussion topics

- Development process
- Automation
- Container image scanning
- Soft vs. hard multi-tenancy
  - Same company, different teams
  - Different companies or customers
- Non-Prod vs. Prod
- Cost
- [GitOps](https://www.weave.works/technologies/gitops/)
  - [Flux](https://fluxcd.io/)
- Business criticality: High vs. low
- Cluster management
  - Operational tasks
  - Monitoring
  - Cluster upgrades
  - Application manifest updates
- [Azure Kubernetes Service (AKS) considerations for multitenancy](https://learn.microsoft.com/en-us/azure/architecture/guide/multitenant/service/aks)
- [Multi-tenancy](https://kubernetes.io/docs/concepts/security/multi-tenancy/)
- [Extending Kubernetes](https://kubernetes.io/docs/concepts/extend-kubernetes/)
  - [Custom Resources](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)
  - [Custom Resource Definitions (CRDs)](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/#customresourcedefinitions)
    - [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/)
- Monitoring: App vs. Cluster
- [Role-based access control (RBAC)](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
  - Define roles: From Cluster admin to User
- [Assigning Pods to Nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/)
- [Taints and Tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)
- [Network policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
  - [Network policy options in AKS](https://docs.microsoft.com/en-us/azure/aks/use-network-policies#network-policy-options-in-aks)
- [Resource quotas](https://kubernetes.io/docs/concepts/policy/resource-quotas/)
- Others
  - [Hierarchical Namespaces](https://kubernetes.io/blog/2020/08/14/introducing-hierarchical-namespaces/)
    - [The Hierarchical Namespace Controller (HNC)](https://github.com/kubernetes-sigs/hierarchical-namespaces)
  - [kiosk](https://github.com/loft-sh/kiosk)
  - [Capsule](https://capsule.clastix.io/)
  - [Virtual Kubernetes Clusters](https://www.vcluster.com/docs/what-are-virtual-clusters)
  - [Kata Containers](https://katacontainers.io/)
    - [Preview support for Kata VM Isolated Containers on AKS for Pod Sandboxing](https://techcommunity.microsoft.com/t5/apps-on-azure-blog/preview-support-for-kata-vm-isolated-containers-on-aks-for-pod/ba-p/3751557)
    - [Aligning with Kata Confidential Containers to achieve zero trust operator deployments with AKS](https://techcommunity.microsoft.com/t5/azure-confidential-computing/aligning-with-kata-confidential-containers-to-achieve-zero-trust/ba-p/3797876)

### References

- [Multi-Tenancy in Kubernetes: Best Practices Today, and Future Directions](https://www.youtube.com/watch?v=xygE8DbwJ7c)
- [Three Tenancy Models For Kubernetes](https://kubernetes.io/blog/2021/04/15/three-tenancy-models-for-kubernetes/)
- [Cluster multi-tenancy](https://cloud.google.com/kubernetes-engine/docs/concepts/multitenancy-overview)
- [Multi-Tenant Clusters with Hierarchical Namespaces](https://www.youtube.com/watch?v=j5x6NumP21c)
- [Multi-Tenant Kubernetes Cluster With Capsule](https://www.youtube.com/watch?v=H8bzEJN7fj8)
- [How To Create Virtual Kubernetes Clusters With vcluster](https://www.youtube.com/watch?v=JqBjpvp268Y)
