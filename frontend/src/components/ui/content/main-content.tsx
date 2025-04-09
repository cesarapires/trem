interface MainContentProps {
  children: React.ReactNode;
}

const MainContent: React.FC<MainContentProps> = ({ children }) => {
  return (
    <div className="mt-4">
      {children}
    </div>
  );
};

export default MainContent;
