import { ReactNode } from "react";
import MainContent from "@/components/ui/content/main-content";
import SidebarContent from "@/components/ui/sidebar/sidebar-content";

type LayoutProps = {
  children?: ReactNode;
};

type LayoutPropsExtended = {
  children?: ReactNode;
  header?: ReactNode;
}

export default function UserAreaLayout(props: LayoutProps | LayoutPropsExtended) {
  const { children, header } = {
    ...props,
    header: undefined,
  };

  return (
    <div className="bg-green-100 min-h-screen flex">
      <SidebarContent />
      <div className="w-3/4 p-4">
        {header}
        <MainContent>{children}</MainContent>
      </div>
    </div>
  );
}

